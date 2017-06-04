// tipsy, facebook style tooltips for jquery
// version 1.0.0a
// (c) 2008-2010 jason frame [jason@onehackoranother.com]
// released under the MIT license

(function ($) {

    function Tipsy(element, options) {
        this.$element = $(element);
        this.options = options;
        this.enabled = true;
        this.fixTitle();
    }

    Tipsy.prototype = {
        show: function () {
            var title = this.getTitle();
            if (title && this.enabled) {
                var $tip = this.tip();

                $tip.find('.tipsy-inner')[this.options.html ? 'html' : 'text'](title);
                $tip[0].className = 'tipsy'; // reset classname in case of dynamic gravity
                $tip.remove().css({top: 0, left: 0, visibility: 'hidden', display: 'block'}).appendTo(document.body);

                var pos = $.extend({}, this.$element.offset(), {
                    width: this.$element[0].offsetWidth,
                    height: this.$element[0].offsetHeight
                });

                var actualWidth = $tip[0].offsetWidth, actualHeight = $tip[0].offsetHeight;
                var gravity = (typeof this.options.gravity == 'function')
                    ? this.options.gravity.call(this.$element[0])
                    : this.options.gravity;

                var tp;
                switch (gravity.charAt(0)) {
                    case 'n':
                        tp = {
                            top: pos.top + pos.height + this.options.offset,
                            left: pos.left + pos.width / 2 - actualWidth / 2
                        };
                        break;
                    case 's':
                        tp = {
                            top: pos.top - actualHeight - this.options.offset,
                            left: pos.left + pos.width / 2 - actualWidth / 2
                        };
                        break;
                    case 'e':
                        tp = {
                            top: pos.top + pos.height / 2 - actualHeight / 2,
                            left: pos.left - actualWidth - this.options.offset
                        };
                        break;
                    case 'w':
                        tp = {
                            top: pos.top + pos.height / 2 - actualHeight / 2,
                            left: pos.left + pos.width + this.options.offset
                        };
                        break;
                }

                if (gravity.length == 2) {
                    if (gravity.charAt(1) == 'w') {
                        tp.left = pos.left + pos.width / 2 - 15;
                    } else {
                        tp.left = pos.left + pos.width / 2 - actualWidth + 15;
                    }
                }

                $tip.css(tp).addClass('tipsy-' + gravity);

                if (this.options.fade) {
                    $tip.stop().css({
                        opacity: 0,
                        display: 'block',
                        visibility: 'visible'
                    }).animate({opacity: this.options.opacity});
                } else {
                    $tip.css({visibility: 'visible', opacity: this.options.opacity});
                }
            }
        },

        hide: function () {
            if (this.options.fade) {
                this.tip().stop().fadeOut(function () {
                    $(this).remove();
                });
            } else {
                this.tip().remove();
            }
        },

        fixTitle: function () {
            var $e = this.$element;
            if ($e.attr('title') || typeof($e.attr('original-title')) != 'string') {
                $e.attr('original-title', $e.attr('title') || '').removeAttr('title');
            }
        },

        getTitle: function () {
            var title, $e = this.$element, o = this.options;
            this.fixTitle();
            var title, o = this.options;
            if (typeof o.title == 'string') {
                title = $e.attr(o.title == 'title' ? 'original-title' : o.title);
            } else if (typeof o.title == 'function') {
                title = o.title.call($e[0]);
            }
            title = ('' + title).replace(/(^\s*|\s*$)/, "");
            return title || o.fallback;
        },

        tip: function () {
            if (!this.$tip) {
                this.$tip = $('<div class="tipsy"></div>').html('<div class="tipsy-arrow"></div><div class="tipsy-inner"></div>');
            }
            return this.$tip;
        },

        validate: function () {
            if (!this.$element[0].parentNode) {
                this.hide();
                this.$element = null;
                this.options = null;
            }
        },

        enable: function () {
            this.enabled = true;
        },
        disable: function () {
            this.enabled = false;
        },
        toggleEnabled: function () {
            this.enabled = !this.enabled;
        }
    };

    $.fn.tipsy = function (options) {

        if (options === true) {
            return this.data('tipsy');
        } else if (typeof options == 'string') {
            var tipsy = this.data('tipsy');
            if (tipsy) tipsy[options]();
            return this;
        }

        options = $.extend({}, $.fn.tipsy.defaults, options);

        function get(ele) {
            var tipsy = $.data(ele, 'tipsy');
            if (!tipsy) {
                tipsy = new Tipsy(ele, $.fn.tipsy.elementOptions(ele, options));
                $.data(ele, 'tipsy', tipsy);
            }
            return tipsy;
        }

        function enter() {
            var tipsy = get(this);
            tipsy.hoverState = 'in';
            if (options.delayIn == 0) {
                tipsy.show();
            } else {
                tipsy.fixTitle();
                setTimeout(function () {
                    if (tipsy.hoverState == 'in') tipsy.show();
                }, options.delayIn);
            }
        };

        function leave() {
            var tipsy = get(this);
            tipsy.hoverState = 'out';
            if (options.delayOut == 0) {
                tipsy.hide();
            } else {
                setTimeout(function () {
                    if (tipsy.hoverState == 'out') tipsy.hide();
                }, options.delayOut);
            }
        };

        if (!options.live) this.each(function () {
            get(this);
        });

        if (options.trigger != 'manual') {
            var binder = options.live ? 'live' : 'bind',
                eventIn = options.trigger == 'hover' ? 'mouseenter' : 'focus',
                eventOut = options.trigger == 'hover' ? 'mouseleave' : 'blur';
            this[binder](eventIn, enter)[binder](eventOut, leave);
        }

        return this;

    };

    $.fn.tipsy.defaults = {
        delayIn: 0,
        delayOut: 0,
        fade: false,
        fallback: '',
        gravity: 'n',
        html: false,
        live: false,
        offset: 0,
        opacity: 0.8,
        title: 'title',
        trigger: 'hover'
    };

    // Overwrite this method to provide options on a per-element basis.
    // For example, you could store the gravity in a 'tipsy-gravity' attribute:
    // return $.extend({}, options, {gravity: $(ele).attr('tipsy-gravity') || 'n' });
    // (remember - do not modify 'options' in place!)
    $.fn.tipsy.elementOptions = function (ele, options) {
        return $.metadata ? $.extend({}, options, $(ele).metadata()) : options;
    };

    $.fn.tipsy.autoNS = function () {
        return $(this).offset().top > ($(document).scrollTop() + $(window).height() / 2) ? 's' : 'n';
    };

    $.fn.tipsy.autoWE = function () {
        return $(this).offset().left > ($(document).scrollLeft() + $(window).width() / 2) ? 'e' : 'w';
    };

})(jQuery);


/* ==========================================================
 * bootstrap-affix.js v2.1.1
 * /web/20150104113745/http://twitter.github.com/bootstrap/javascript.html#affix
 * ==========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * /web/20150104113745/http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */


!function ($) {

    "use strict"; // jshint ;_;


    /* AFFIX CLASS DEFINITION
     * ====================== */

    var Affix = function (element, options) {
        this.options = $.extend({}, $.fn.affix.defaults, options)
        this.$window = $(window).on('scroll.affix.data-api', $.proxy(this.checkPosition, this))
        this.$element = $(element)
        this.checkPosition()
    }

    Affix.prototype.checkPosition = function () {
        if (!this.$element.is(':visible')) return

        var scrollHeight = $(document).height()
            , scrollTop = this.$window.scrollTop()
            , position = this.$element.offset()
            , offset = this.options.offset
            , offsetBottom = offset.bottom
            , offsetTop = offset.top
            , reset = 'affix affix-top affix-bottom'
            , affix

        if (typeof offset != 'object') offsetBottom = offsetTop = offset
        if (typeof offsetTop == 'function') offsetTop = offset.top()
        if (typeof offsetBottom == 'function') offsetBottom = offset.bottom()

        affix = this.unpin != null && (scrollTop + this.unpin <= position.top) ?
            false : offsetBottom != null && (position.top + this.$element.height() >= scrollHeight - offsetBottom) ?
                'bottom' : offsetTop != null && scrollTop <= offsetTop ?
                    'top' : false

        if (this.affixed === affix) return

        this.affixed = affix
        this.unpin = affix == 'bottom' ? position.top - scrollTop : null

        this.$element.removeClass(reset).addClass('affix' + (affix ? '-' + affix : ''))
    }


    /* AFFIX PLUGIN DEFINITION
     * ======================= */

    $.fn.affix = function (option) {
        return this.each(function () {
            var $this = $(this)
                , data = $this.data('affix')
                , options = typeof option == 'object' && option
            if (!data) $this.data('affix', (data = new Affix(this, options)))
            if (typeof option == 'string') data[option]()
        })
    }

    $.fn.affix.Constructor = Affix

    $.fn.affix.defaults = {
        offset: 0
    }


    /* AFFIX DATA-API
     * ============== */

    $(window).on('load', function () {
        $('[data-spy="affix"]').each(function () {
            var $spy = $(this)
                , data = $spy.data()

            data.offset = data.offset || {}

            data.offsetBottom && (data.offset.bottom = data.offsetBottom)
            data.offsetTop && (data.offset.top = data.offsetTop)

            $spy.affix(data)
        })
    })


}(window.jQuery);


/* ==========================================================
 * bootstrap-alert.js v2.1.1
 * /web/20150104113745/http://twitter.github.com/bootstrap/javascript.html#alerts
 * ==========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * /web/20150104113745/http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */


!function ($) {

    "use strict"; // jshint ;_;


    /* ALERT CLASS DEFINITION
     * ====================== */

    var dismiss = '[data-dismiss="alert"]'
        , Alert = function (el) {
        $(el).on('click', dismiss, this.close)
    }

    Alert.prototype.close = function (e) {
        var $this = $(this)
            , selector = $this.attr('data-target')
            , $parent

        if (!selector) {
            selector = $this.attr('href')
            selector = selector && selector.replace(/.*(?=#[^\s]*$)/, '') //strip for ie7
        }

        $parent = $(selector)

        e && e.preventDefault()

        $parent.length || ($parent = $this.hasClass('alert') ? $this : $this.parent())

        $parent.trigger(e = $.Event('close'))

        if (e.isDefaultPrevented()) return

        $parent.removeClass('in')

        function removeElement() {
            $parent
                .trigger('closed')
                .remove()
        }

        $.support.transition && $parent.hasClass('fade') ?
            $parent.on($.support.transition.end, removeElement) :
            removeElement()
    }


    /* ALERT PLUGIN DEFINITION
     * ======================= */

    $.fn.alert = function (option) {
        return this.each(function () {
            var $this = $(this)
                , data = $this.data('alert')
            if (!data) $this.data('alert', (data = new Alert(this)))
            if (typeof option == 'string') data[option].call($this)
        })
    }

    $.fn.alert.Constructor = Alert


    /* ALERT DATA-API
     * ============== */

    $(function () {
        $('body').on('click.alert.data-api', dismiss, Alert.prototype.close)
    })

}(window.jQuery);


/* ============================================================
 * bootstrap-button.js v2.1.1
 * /web/20150104113745/http://twitter.github.com/bootstrap/javascript.html#buttons
 * ============================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * /web/20150104113745/http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================ */


!function ($) {

    "use strict"; // jshint ;_;


    /* BUTTON PUBLIC CLASS DEFINITION
     * ============================== */

    var Button = function (element, options) {
        this.$element = $(element)
        this.options = $.extend({}, $.fn.button.defaults, options)
    }

    Button.prototype.setState = function (state) {
        var d = 'disabled'
            , $el = this.$element
            , data = $el.data()
            , val = $el.is('input') ? 'val' : 'html'

        state = state + 'Text'
        data.resetText || $el.data('resetText', $el[val]())

        $el[val](data[state] || this.options[state])

        // push to event loop to allow forms to submit
        setTimeout(function () {
            state == 'loadingText' ?
                $el.addClass(d).attr(d, d) :
                $el.removeClass(d).removeAttr(d)
        }, 0)
    }

    Button.prototype.toggle = function () {
        var $parent = this.$element.closest('[data-toggle="buttons-radio"]')

        $parent && $parent
            .find('.active')
            .removeClass('active')

        this.$element.toggleClass('active')
    }


    /* BUTTON PLUGIN DEFINITION
     * ======================== */

    $.fn.button = function (option) {
        return this.each(function () {
            var $this = $(this)
                , data = $this.data('button')
                , options = typeof option == 'object' && option
            if (!data) $this.data('button', (data = new Button(this, options)))
            if (option == 'toggle') data.toggle()
            else if (option) data.setState(option)
        })
    }

    $.fn.button.defaults = {
        loadingText: 'loading...'
    }

    $.fn.button.Constructor = Button


    /* BUTTON DATA-API
     * =============== */

    $(function () {
        $('body').on('click.button.data-api', '[data-toggle^=button]', function (e) {
            var $btn = $(e.target)
            if (!$btn.hasClass('btn')) $btn = $btn.closest('.btn')
            $btn.button('toggle')
        })
    })

}(window.jQuery);


/* ==========================================================
 * bootstrap-carousel.js v2.1.1
 * /web/20150104113745/http://twitter.github.com/bootstrap/javascript.html#carousel
 * ==========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * /web/20150104113745/http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */


!function ($) {

    "use strict"; // jshint ;_;


    /* CAROUSEL CLASS DEFINITION
     * ========================= */

    var Carousel = function (element, options) {
        this.$element = $(element)
        this.options = options
        this.options.slide && this.slide(this.options.slide)
        this.options.pause == 'hover' && this.$element
            .on('mouseenter', $.proxy(this.pause, this))
            .on('mouseleave', $.proxy(this.cycle, this))
    }

    Carousel.prototype = {

        cycle: function (e) {
            if (!e) this.paused = false
            this.options.interval
            && !this.paused
            && (this.interval = setInterval($.proxy(this.next, this), this.options.interval))
            return this
        }

        , to: function (pos) {
            var $active = this.$element.find('.item.active')
                , children = $active.parent().children()
                , activePos = children.index($active)
                , that = this

            if (pos > (children.length - 1) || pos < 0) return

            if (this.sliding) {
                return this.$element.one('slid', function () {
                    that.to(pos)
                })
            }

            if (activePos == pos) {
                return this.pause().cycle()
            }

            return this.slide(pos > activePos ? 'next' : 'prev', $(children[pos]))
        }

        , pause: function (e) {
            if (!e) this.paused = true
            if (this.$element.find('.next, .prev').length && $.support.transition.end) {
                this.$element.trigger($.support.transition.end)
                this.cycle()
            }
            clearInterval(this.interval)
            this.interval = null
            return this
        }

        , next: function () {
            if (this.sliding) return
            return this.slide('next')
        }

        , prev: function () {
            if (this.sliding) return
            return this.slide('prev')
        }

        , slide: function (type, next) {
            var $active = this.$element.find('.item.active')
                , $next = next || $active[type]()
                , isCycling = this.interval
                , direction = type == 'next' ? 'left' : 'right'
                , fallback = type == 'next' ? 'first' : 'last'
                , that = this
                , e = $.Event('slide', {
                relatedTarget: $next[0]
            })

            this.sliding = true

            isCycling && this.pause()

            $next = $next.length ? $next : this.$element.find('.item')[fallback]()

            if ($next.hasClass('active')) return

            if ($.support.transition && this.$element.hasClass('slide')) {
                this.$element.trigger(e)
                if (e.isDefaultPrevented()) return
                $next.addClass(type)
                $next[0].offsetWidth // force reflow
                $active.addClass(direction)
                $next.addClass(direction)
                this.$element.one($.support.transition.end, function () {
                    $next.removeClass([type, direction].join(' ')).addClass('active')
                    $active.removeClass(['active', direction].join(' '))
                    that.sliding = false
                    setTimeout(function () {
                        that.$element.trigger('slid')
                    }, 0)
                })
            } else {
                this.$element.trigger(e)
                if (e.isDefaultPrevented()) return
                $active.removeClass('active')
                $next.addClass('active')
                this.sliding = false
                this.$element.trigger('slid')
            }

            isCycling && this.cycle()

            return this
        }

    }


    /* CAROUSEL PLUGIN DEFINITION
     * ========================== */

    $.fn.carousel = function (option) {
        return this.each(function () {
            var $this = $(this)
                , data = $this.data('carousel')
                , options = $.extend({}, $.fn.carousel.defaults, typeof option == 'object' && option)
                , action = typeof option == 'string' ? option : options.slide
            if (!data) $this.data('carousel', (data = new Carousel(this, options)))
            if (typeof option == 'number') data.to(option)
            else if (action) data[action]()
            else if (options.interval) data.cycle()
        })
    }

    $.fn.carousel.defaults = {
        interval: 5000
        , pause: 'hover'
    }

    $.fn.carousel.Constructor = Carousel


    /* CAROUSEL DATA-API
     * ================= */

    $(function () {
        $('body').on('click.carousel.data-api', '[data-slide]', function (e) {
            var $this = $(this), href
                , $target = $($this.attr('data-target') || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '')) //strip for ie7
                , options = !$target.data('modal') && $.extend({}, $target.data(), $this.data())
            $target.carousel(options)
            e.preventDefault()
        })
    })

}(window.jQuery);


/* =============================================================
 * bootstrap-collapse.js v2.1.1
 * /web/20150104113745/http://twitter.github.com/bootstrap/javascript.html#collapse
 * =============================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * /web/20150104113745/http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================ */


!function ($) {

    "use strict"; // jshint ;_;


    /* COLLAPSE PUBLIC CLASS DEFINITION
     * ================================ */

    var Collapse = function (element, options) {
        this.$element = $(element)
        this.options = $.extend({}, $.fn.collapse.defaults, options)

        if (this.options.parent) {
            this.$parent = $(this.options.parent)
        }

        this.options.toggle && this.toggle()
    }

    Collapse.prototype = {

        constructor: Collapse

        , dimension: function () {
            var hasWidth = this.$element.hasClass('width')
            return hasWidth ? 'width' : 'height'
        }

        , show: function () {
            var dimension
                , scroll
                , actives
                , hasData

            if (this.transitioning) return

            dimension = this.dimension()
            scroll = $.camelCase(['scroll', dimension].join('-'))
            actives = this.$parent && this.$parent.find('> .accordion-group > .in')

            if (actives && actives.length) {
                hasData = actives.data('collapse')
                if (hasData && hasData.transitioning) return
                actives.collapse('hide')
                hasData || actives.data('collapse', null)
            }

            this.$element[dimension](0)
            this.transition('addClass', $.Event('show'), 'shown')
            $.support.transition && this.$element[dimension](this.$element[0][scroll])
        }

        , hide: function () {
            var dimension
            if (this.transitioning) return
            dimension = this.dimension()
            this.reset(this.$element[dimension]())
            this.transition('removeClass', $.Event('hide'), 'hidden')
            this.$element[dimension](0)
        }

        , reset: function (size) {
            var dimension = this.dimension()

            this.$element
                .removeClass('collapse')
                [dimension](size || 'auto')
                [0].offsetWidth

            this.$element[size !== null ? 'addClass' : 'removeClass']('collapse')

            return this
        }

        , transition: function (method, startEvent, completeEvent) {
            var that = this
                , complete = function () {
                if (startEvent.type == 'show') that.reset()
                that.transitioning = 0
                that.$element.trigger(completeEvent)
            }

            this.$element.trigger(startEvent)

            if (startEvent.isDefaultPrevented()) return

            this.transitioning = 1

            this.$element[method]('in')

            $.support.transition && this.$element.hasClass('collapse') ?
                this.$element.one($.support.transition.end, complete) :
                complete()
        }

        , toggle: function () {
            this[this.$element.hasClass('in') ? 'hide' : 'show']()
        }

    }


    /* COLLAPSIBLE PLUGIN DEFINITION
     * ============================== */

    $.fn.collapse = function (option) {
        return this.each(function () {
            var $this = $(this)
                , data = $this.data('collapse')
                , options = typeof option == 'object' && option
            if (!data) $this.data('collapse', (data = new Collapse(this, options)))
            if (typeof option == 'string') data[option]()
        })
    }

    $.fn.collapse.defaults = {
        toggle: true
    }

    $.fn.collapse.Constructor = Collapse


    /* COLLAPSIBLE DATA-API
     * ==================== */

    $(function () {
        $('body').on('click.collapse.data-api', '[data-toggle=collapse]', function (e) {
            var $this = $(this), href
                , target = $this.attr('data-target')
                || e.preventDefault()
                || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '') //strip for ie7
                , option = $(target).data('collapse') ? 'toggle' : $this.data()
            $this[$(target).hasClass('in') ? 'addClass' : 'removeClass']('collapsed')
            $(target).collapse(option)
        })
    })

}(window.jQuery);


/* ============================================================
 * bootstrap-dropdown.js v2.1.1
 * /web/20150104113745/http://twitter.github.com/bootstrap/javascript.html#dropdowns
 * ============================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * /web/20150104113745/http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================ */


!function ($) {

    "use strict"; // jshint ;_;


    /* DROPDOWN CLASS DEFINITION
     * ========================= */

    var toggle = '[data-toggle=dropdown]'
        , Dropdown = function (element) {
        var $el = $(element).on('click.dropdown.data-api', this.toggle)
        $('html').on('click.dropdown.data-api', function () {
            $el.parent().removeClass('open')
        })
    }

    Dropdown.prototype = {

        constructor: Dropdown

        , toggle: function (e) {
            var $this = $(this)
                , $parent
                , isActive

            if ($this.is('.disabled, :disabled')) return

            $parent = getParent($this)

            isActive = $parent.hasClass('open')

            clearMenus()

            if (!isActive) {
                $parent.toggleClass('open')
                $this.focus()
            }

            return false
        }

        , keydown: function (e) {
            var $this
                , $items
                , $active
                , $parent
                , isActive
                , index

            if (!/(38|40|27)/.test(e.keyCode)) return

            $this = $(this)

            e.preventDefault()
            e.stopPropagation()

            if ($this.is('.disabled, :disabled')) return

            $parent = getParent($this)

            isActive = $parent.hasClass('open')

            if (!isActive || (isActive && e.keyCode == 27)) return $this.click()

            $items = $('[role=menu] li:not(.divider) a', $parent)

            if (!$items.length) return

            index = $items.index($items.filter(':focus'))

            if (e.keyCode == 38 && index > 0) index--                                        // up
            if (e.keyCode == 40 && index < $items.length - 1) index++                        // down
            if (!~index) index = 0

            $items
                .eq(index)
                .focus()
        }

    }

    function clearMenus() {
        getParent($(toggle))
            .removeClass('open')
    }

    function getParent($this) {
        var selector = $this.attr('data-target')
            , $parent

        if (!selector) {
            selector = $this.attr('href')
            selector = selector && /#/.test(selector) && selector.replace(/.*(?=#[^\s]*$)/, '') //strip for ie7
        }

        $parent = $(selector)
        $parent.length || ($parent = $this.parent())

        return $parent
    }


    /* DROPDOWN PLUGIN DEFINITION
     * ========================== */

    $.fn.dropdown = function (option) {
        return this.each(function () {
            var $this = $(this)
                , data = $this.data('dropdown')
            if (!data) $this.data('dropdown', (data = new Dropdown(this)))
            if (typeof option == 'string') data[option].call($this)
        })
    }

    $.fn.dropdown.Constructor = Dropdown


    /* APPLY TO STANDARD DROPDOWN ELEMENTS
     * =================================== */

    $(function () {
        $('html')
            .on('click.dropdown.data-api touchstart.dropdown.data-api', clearMenus)
        $('body')
            .on('click.dropdown touchstart.dropdown.data-api', '.dropdown form', function (e) {
                e.stopPropagation()
            })
            .on('click.dropdown.data-api touchstart.dropdown.data-api', toggle, Dropdown.prototype.toggle)
            .on('keydown.dropdown.data-api touchstart.dropdown.data-api', toggle + ', [role=menu]', Dropdown.prototype.keydown)
    })

}(window.jQuery);


/* =========================================================
 * bootstrap-modal.js v2.1.1
 * /web/20150104113745/http://twitter.github.com/bootstrap/javascript.html#modals
 * =========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * /web/20150104113745/http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================= */


!function ($) {

    "use strict"; // jshint ;_;


    /* MODAL CLASS DEFINITION
     * ====================== */

    var Modal = function (element, options) {
        this.options = options
        this.$element = $(element)
            .delegate('[data-dismiss="modal"]', 'click.dismiss.modal', $.proxy(this.hide, this))
        this.options.remote && this.$element.find('.modal-body').load(this.options.remote)
    }

    Modal.prototype = {

        constructor: Modal

        , toggle: function () {
            return this[!this.isShown ? 'show' : 'hide']()
        }

        , show: function () {
            var that = this
                , e = $.Event('show')

            this.$element.trigger(e)

            if (this.isShown || e.isDefaultPrevented()) return

            $('body').addClass('modal-open')

            this.isShown = true

            this.escape()

            this.backdrop(function () {
                var transition = $.support.transition && that.$element.hasClass('fade')

                if (!that.$element.parent().length) {
                    that.$element.appendTo(document.body) //don't move modals dom position
                }

                that.$element
                    .show()

                if (transition) {
                    that.$element[0].offsetWidth // force reflow
                }

                that.$element
                    .addClass('in')
                    .attr('aria-hidden', false)
                    .focus()

                that.enforceFocus()

                transition ?
                    that.$element.one($.support.transition.end, function () {
                        that.$element.trigger('shown')
                    }) :
                    that.$element.trigger('shown')

            })
        }

        , hide: function (e) {
            e && e.preventDefault()

            var that = this

            e = $.Event('hide')

            this.$element.trigger(e)

            if (!this.isShown || e.isDefaultPrevented()) return

            this.isShown = false

            $('body').removeClass('modal-open')

            this.escape()

            $(document).off('focusin.modal')

            this.$element
                .removeClass('in')
                .attr('aria-hidden', true)

            $.support.transition && this.$element.hasClass('fade') ?
                this.hideWithTransition() :
                this.hideModal()
        }

        , enforceFocus: function () {
            var that = this
            $(document).on('focusin.modal', function (e) {
                if (that.$element[0] !== e.target && !that.$element.has(e.target).length) {
                    that.$element.focus()
                }
            })
        }

        , escape: function () {
            var that = this
            if (this.isShown && this.options.keyboard) {
                this.$element.on('keyup.dismiss.modal', function (e) {
                    e.which == 27 && that.hide()
                })
            } else if (!this.isShown) {
                this.$element.off('keyup.dismiss.modal')
            }
        }

        , hideWithTransition: function () {
            var that = this
                , timeout = setTimeout(function () {
                that.$element.off($.support.transition.end)
                that.hideModal()
            }, 500)

            this.$element.one($.support.transition.end, function () {
                clearTimeout(timeout)
                that.hideModal()
            })
        }

        , hideModal: function (that) {
            this.$element
                .hide()
                .trigger('hidden')

            this.backdrop()
        }

        , removeBackdrop: function () {
            this.$backdrop.remove()
            this.$backdrop = null
        }

        , backdrop: function (callback) {
            var that = this
                , animate = this.$element.hasClass('fade') ? 'fade' : ''

            if (this.isShown && this.options.backdrop) {
                var doAnimate = $.support.transition && animate

                this.$backdrop = $('<div class="modal-backdrop ' + animate + '" />')
                    .appendTo(document.body)

                if (this.options.backdrop != 'static') {
                    this.$backdrop.click($.proxy(this.hide, this))
                }

                if (doAnimate) this.$backdrop[0].offsetWidth // force reflow

                this.$backdrop.addClass('in')

                doAnimate ?
                    this.$backdrop.one($.support.transition.end, callback) :
                    callback()

            } else if (!this.isShown && this.$backdrop) {
                this.$backdrop.removeClass('in')

                $.support.transition && this.$element.hasClass('fade') ?
                    this.$backdrop.one($.support.transition.end, $.proxy(this.removeBackdrop, this)) :
                    this.removeBackdrop()

            } else if (callback) {
                callback()
            }
        }
    }


    /* MODAL PLUGIN DEFINITION
     * ======================= */

    $.fn.modal = function (option) {
        return this.each(function () {
            var $this = $(this)
                , data = $this.data('modal')
                , options = $.extend({}, $.fn.modal.defaults, $this.data(), typeof option == 'object' && option)
            if (!data) $this.data('modal', (data = new Modal(this, options)))
            if (typeof option == 'string') data[option]()
            else if (options.show) data.show()
        })
    }

    $.fn.modal.defaults = {
        backdrop: true
        , keyboard: true
        , show: true
    }

    $.fn.modal.Constructor = Modal


    /* MODAL DATA-API
     * ============== */

    $(function () {
        $('body').on('click.modal.data-api', '[data-toggle="modal"]', function (e) {
            var $this = $(this)
                , href = $this.attr('href')
                , $target = $($this.attr('data-target') || (href && href.replace(/.*(?=#[^\s]+$)/, ''))) //strip for ie7
                , option = $target.data('modal') ? 'toggle' : $.extend({remote: !/#/.test(href) && href}, $target.data(), $this.data())

            e.preventDefault()

            $target
                .modal(option)
                .one('hide', function () {
                    $this.focus()
                })
        })
    })

}(window.jQuery);


/* ===========================================================
 * bootstrap-tooltip.js v2.1.1
 * /web/20150104113745/http://twitter.github.com/bootstrap/javascript.html#tooltips
 * Inspired by the original jQuery.tipsy by Jason Frame
 * ===========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * /web/20150104113745/http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */


!function ($) {

    "use strict"; // jshint ;_;


    /* TOOLTIP PUBLIC CLASS DEFINITION
     * =============================== */

    var Tooltip = function (element, options) {
        this.init('tooltip', element, options)
    }

    Tooltip.prototype = {

        constructor: Tooltip

        , init: function (type, element, options) {
            var eventIn
                , eventOut

            this.type = type
            this.$element = $(element)
            this.options = this.getOptions(options)
            this.enabled = true

            if (this.options.trigger == 'click') {
                this.$element.on('click.' + this.type, this.options.selector, $.proxy(this.toggle, this))
            } else if (this.options.trigger != 'manual') {
                eventIn = this.options.trigger == 'hover' ? 'mouseenter' : 'focus'
                eventOut = this.options.trigger == 'hover' ? 'mouseleave' : 'blur'
                this.$element.on(eventIn + '.' + this.type, this.options.selector, $.proxy(this.enter, this))
                this.$element.on(eventOut + '.' + this.type, this.options.selector, $.proxy(this.leave, this))
            }

            this.options.selector ?
                (this._options = $.extend({}, this.options, {trigger: 'manual', selector: ''})) :
                this.fixTitle()
        }

        , getOptions: function (options) {
            options = $.extend({}, $.fn[this.type].defaults, options, this.$element.data())

            if (options.delay && typeof options.delay == 'number') {
                options.delay = {
                    show: options.delay
                    , hide: options.delay
                }
            }

            return options
        }

        , enter: function (e) {
            var self = $(e.currentTarget)[this.type](this._options).data(this.type)

            if (!self.options.delay || !self.options.delay.show) return self.show()

            clearTimeout(this.timeout)
            self.hoverState = 'in'
            this.timeout = setTimeout(function () {
                if (self.hoverState == 'in') self.show()
            }, self.options.delay.show)
        }

        , leave: function (e) {
            var self = $(e.currentTarget)[this.type](this._options).data(this.type)

            if (this.timeout) clearTimeout(this.timeout)
            if (!self.options.delay || !self.options.delay.hide) return self.hide()

            self.hoverState = 'out'
            this.timeout = setTimeout(function () {
                if (self.hoverState == 'out') self.hide()
            }, self.options.delay.hide)
        }

        , show: function () {
            var $tip
                , inside
                , pos
                , actualWidth
                , actualHeight
                , placement
                , tp

            if (this.hasContent() && this.enabled) {
                $tip = this.tip()
                this.setContent()

                if (this.options.animation) {
                    $tip.addClass('fade')
                }

                placement = typeof this.options.placement == 'function' ?
                    this.options.placement.call(this, $tip[0], this.$element[0]) :
                    this.options.placement

                inside = /in/.test(placement)

                $tip
                    .remove()
                    .css({top: 0, left: 0, display: 'block'})
                    .appendTo(inside ? this.$element : document.body)

                pos = this.getPosition(inside)

                actualWidth = $tip[0].offsetWidth
                actualHeight = $tip[0].offsetHeight

                switch (inside ? placement.split(' ')[1] : placement) {
                    case 'bottom':
                        tp = {top: pos.top + pos.height, left: pos.left + pos.width / 2 - actualWidth / 2}
                        break
                    case 'top':
                        tp = {top: pos.top - actualHeight, left: pos.left + pos.width / 2 - actualWidth / 2}
                        break
                    case 'left':
                        tp = {top: pos.top + pos.height / 2 - actualHeight / 2, left: pos.left - actualWidth}
                        break
                    case 'right':
                        tp = {top: pos.top + pos.height / 2 - actualHeight / 2, left: pos.left + pos.width}
                        break
                }

                $tip
                    .css(tp)
                    .addClass(placement)
                    .addClass('in')
            }
        }

        , setContent: function () {
            var $tip = this.tip()
                , title = this.getTitle()

            $tip.find('.tooltip-inner')[this.options.html ? 'html' : 'text'](title)
            $tip.removeClass('fade in top bottom left right')
        }

        , hide: function () {
            var that = this
                , $tip = this.tip()

            $tip.removeClass('in')

            function removeWithAnimation() {
                var timeout = setTimeout(function () {
                    $tip.off($.support.transition.end).remove()
                }, 500)

                $tip.one($.support.transition.end, function () {
                    clearTimeout(timeout)
                    $tip.remove()
                })
            }

            $.support.transition && this.$tip.hasClass('fade') ?
                removeWithAnimation() :
                $tip.remove()

            return this
        }

        , fixTitle: function () {
            var $e = this.$element
            if ($e.attr('title') || typeof($e.attr('data-original-title')) != 'string') {
                $e.attr('data-original-title', $e.attr('title') || '').removeAttr('title')
            }
        }

        , hasContent: function () {
            return this.getTitle()
        }

        , getPosition: function (inside) {
            return $.extend({}, (inside ? {top: 0, left: 0} : this.$element.offset()), {
                width: this.$element[0].offsetWidth
                , height: this.$element[0].offsetHeight
            })
        }

        , getTitle: function () {
            var title
                , $e = this.$element
                , o = this.options

            title = $e.attr('data-original-title')
                || (typeof o.title == 'function' ? o.title.call($e[0]) : o.title)

            return title
        }

        , tip: function () {
            return this.$tip = this.$tip || $(this.options.template)
        }

        , validate: function () {
            if (!this.$element[0].parentNode) {
                this.hide()
                this.$element = null
                this.options = null
            }
        }

        , enable: function () {
            this.enabled = true
        }

        , disable: function () {
            this.enabled = false
        }

        , toggleEnabled: function () {
            this.enabled = !this.enabled
        }

        , toggle: function () {
            this[this.tip().hasClass('in') ? 'hide' : 'show']()
        }

        , destroy: function () {
            this.hide().$element.off('.' + this.type).removeData(this.type)
        }

    }


    /* TOOLTIP PLUGIN DEFINITION
     * ========================= */

    $.fn.tooltip = function (option) {
        return this.each(function () {
            var $this = $(this)
                , data = $this.data('tooltip')
                , options = typeof option == 'object' && option
            if (!data) $this.data('tooltip', (data = new Tooltip(this, options)))
            if (typeof option == 'string') data[option]()
        })
    }

    $.fn.tooltip.Constructor = Tooltip

    $.fn.tooltip.defaults = {
        animation: true
        , placement: 'top'
        , selector: false
        , template: '<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>'
        , trigger: 'hover'
        , title: ''
        , delay: 0
        , html: true
    }

}(window.jQuery);


/* ===========================================================
 * bootstrap-popover.js v2.1.1
 * /web/20150104113745/http://twitter.github.com/bootstrap/javascript.html#popovers
 * ===========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * /web/20150104113745/http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * =========================================================== */


!function ($) {

    "use strict"; // jshint ;_;


    /* POPOVER PUBLIC CLASS DEFINITION
     * =============================== */

    var Popover = function (element, options) {
        this.init('popover', element, options)
    }


    /* NOTE: POPOVER EXTENDS BOOTSTRAP-TOOLTIP.js
     ========================================== */

    Popover.prototype = $.extend({}, $.fn.tooltip.Constructor.prototype, {

        constructor: Popover

        , setContent: function () {
            var $tip = this.tip()
                , title = this.getTitle()
                , content = this.getContent()

            $tip.find('.popover-title')[this.options.html ? 'html' : 'text'](title)
            $tip.find('.popover-content > *')[this.options.html ? 'html' : 'text'](content)

            $tip.removeClass('fade top bottom left right in')
        }

        , hasContent: function () {
            return this.getTitle() || this.getContent()
        }

        , getContent: function () {
            var content
                , $e = this.$element
                , o = this.options

            content = $e.attr('data-content')
                || (typeof o.content == 'function' ? o.content.call($e[0]) : o.content)

            return content
        }

        , tip: function () {
            if (!this.$tip) {
                this.$tip = $(this.options.template)
            }
            return this.$tip
        }

        , destroy: function () {
            this.hide().$element.off('.' + this.type).removeData(this.type)
        }

    })


    /* POPOVER PLUGIN DEFINITION
     * ======================= */

    $.fn.popover = function (option) {
        return this.each(function () {
            var $this = $(this)
                , data = $this.data('popover')
                , options = typeof option == 'object' && option
            if (!data) $this.data('popover', (data = new Popover(this, options)))
            if (typeof option == 'string') data[option]()
        })
    }

    $.fn.popover.Constructor = Popover

    $.fn.popover.defaults = $.extend({}, $.fn.tooltip.defaults, {
        placement: 'right'
        ,
        trigger: 'click'
        ,
        content: ''
        ,
        template: '<div class="popover"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"><p></p></div></div></div>'
    })

}(window.jQuery);


/* =============================================================
 * bootstrap-scrollspy.js v2.1.1
 * /web/20150104113745/http://twitter.github.com/bootstrap/javascript.html#scrollspy
 * =============================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * /web/20150104113745/http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================== */


!function ($) {

    "use strict"; // jshint ;_;


    /* SCROLLSPY CLASS DEFINITION
     * ========================== */

    function ScrollSpy(element, options) {
        var process = $.proxy(this.process, this)
            , $element = $(element).is('body') ? $(window) : $(element)
            , href
        this.options = $.extend({}, $.fn.scrollspy.defaults, options)
        this.$scrollElement = $element.on('scroll.scroll-spy.data-api', process)
        this.selector = (this.options.target
            || ((href = $(element).attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '')) //strip for ie7
            || '') + ' .nav li > a'
        this.$body = $('body')
        this.refresh()
        this.process()
    }

    ScrollSpy.prototype = {

        constructor: ScrollSpy

        , refresh: function () {
            var self = this
                , $targets

            this.offsets = $([])
            this.targets = $([])

            $targets = this.$body
                .find(this.selector)
                .map(function () {
                    var $el = $(this)
                        , href = $el.data('target') || $el.attr('href')
                        , $href = /^#\w/.test(href) && $(href)
                    return ( $href
                        && $href.length
                        && [[$href.position().top, href]] ) || null
                })
                .sort(function (a, b) {
                    return a[0] - b[0]
                })
                .each(function () {
                    self.offsets.push(this[0])
                    self.targets.push(this[1])
                })
        }

        , process: function () {
            var scrollTop = this.$scrollElement.scrollTop() + this.options.offset
                , scrollHeight = this.$scrollElement[0].scrollHeight || this.$body[0].scrollHeight
                , maxScroll = scrollHeight - this.$scrollElement.height()
                , offsets = this.offsets
                , targets = this.targets
                , activeTarget = this.activeTarget
                , i

            if (scrollTop >= maxScroll) {
                return activeTarget != (i = targets.last()[0])
                    && this.activate(i)
            }

            for (i = offsets.length; i--;) {
                activeTarget != targets[i]
                && scrollTop >= offsets[i]
                && (!offsets[i + 1] || scrollTop <= offsets[i + 1])
                && this.activate(targets[i])
            }
        }

        , activate: function (target) {
            var active
                , selector

            this.activeTarget = target

            $(this.selector)
                .parent('.active')
                .removeClass('active')

            selector = this.selector
                + '[data-target="' + target + '"],'
                + this.selector + '[href="' + target + '"]'

            active = $(selector)
                .parent('li')
                .addClass('active')

            if (active.parent('.dropdown-menu').length) {
                active = active.closest('li.dropdown').addClass('active')
            }

            active.trigger('activate')
        }

    }


    /* SCROLLSPY PLUGIN DEFINITION
     * =========================== */

    $.fn.scrollspy = function (option) {
        return this.each(function () {
            var $this = $(this)
                , data = $this.data('scrollspy')
                , options = typeof option == 'object' && option
            if (!data) $this.data('scrollspy', (data = new ScrollSpy(this, options)))
            if (typeof option == 'string') data[option]()
        })
    }

    $.fn.scrollspy.Constructor = ScrollSpy

    $.fn.scrollspy.defaults = {
        offset: 10
    }


    /* SCROLLSPY DATA-API
     * ================== */

    $(window).on('load', function () {
        $('[data-spy="scroll"]').each(function () {
            var $spy = $(this)
            $spy.scrollspy($spy.data())
        })
    })

}(window.jQuery);


/* ========================================================
 * bootstrap-tab.js v2.1.1
 * /web/20150104113745/http://twitter.github.com/bootstrap/javascript.html#tabs
 * ========================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * /web/20150104113745/http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ======================================================== */


!function ($) {

    "use strict"; // jshint ;_;


    /* TAB CLASS DEFINITION
     * ==================== */

    var Tab = function (element) {
        this.element = $(element)
    }

    Tab.prototype = {

        constructor: Tab

        , show: function () {
            var $this = this.element
                , $ul = $this.closest('ul:not(.dropdown-menu)')
                , selector = $this.attr('data-target')
                , previous
                , $target
                , e

            if (!selector) {
                selector = $this.attr('href')
                selector = selector && selector.replace(/.*(?=#[^\s]*$)/, '') //strip for ie7
            }

            if ($this.parent('li').hasClass('active')) return

            previous = $ul.find('.active a').last()[0]

            e = $.Event('show', {
                relatedTarget: previous
            })

            $this.trigger(e)

            if (e.isDefaultPrevented()) return

            $target = $(selector)

            this.activate($this.parent('li'), $ul)
            this.activate($target, $target.parent(), function () {
                $this.trigger({
                    type: 'shown'
                    , relatedTarget: previous
                })
            })
        }

        , activate: function (element, container, callback) {
            var $active = container.find('> .active')
                , transition = callback
                && $.support.transition
                && $active.hasClass('fade')

            function next() {
                $active
                    .removeClass('active')
                    .find('> .dropdown-menu > .active')
                    .removeClass('active')

                element.addClass('active')

                if (transition) {
                    element[0].offsetWidth // reflow for transition
                    element.addClass('in')
                } else {
                    element.removeClass('fade')
                }

                if (element.parent('.dropdown-menu')) {
                    element.closest('li.dropdown').addClass('active')
                }

                callback && callback()
            }

            transition ?
                $active.one($.support.transition.end, next) :
                next()

            $active.removeClass('in')
        }
    }


    /* TAB PLUGIN DEFINITION
     * ===================== */

    $.fn.tab = function (option) {
        return this.each(function () {
            var $this = $(this)
                , data = $this.data('tab')
            if (!data) $this.data('tab', (data = new Tab(this)))
            if (typeof option == 'string') data[option]()
        })
    }

    $.fn.tab.Constructor = Tab


    /* TAB DATA-API
     * ============ */

    $(function () {
        $('body').on('click.tab.data-api', '[data-toggle="tab"], [data-toggle="pill"]', function (e) {
            e.preventDefault()
            $(this).tab('show')
        })
    })

}(window.jQuery);


/* ===================================================
 * bootstrap-transition.js v2.1.1
 * /web/20150104113745/http://twitter.github.com/bootstrap/javascript.html#transitions
 * ===================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * /web/20150104113745/http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ========================================================== */


!function ($) {

    $(function () {

        "use strict"; // jshint ;_;


        /* CSS TRANSITION SUPPORT (/web/20150104113745/http://www.modernizr.com/)
         * ======================================================= */

        $.support.transition = (function () {

            var transitionEnd = (function () {

                var el = document.createElement('bootstrap')
                    , transEndEventNames = {
                    'WebkitTransition': 'webkitTransitionEnd'
                    , 'MozTransition': 'transitionend'
                    , 'OTransition': 'oTransitionEnd otransitionend'
                    , 'transition': 'transitionend'
                }
                    , name

                for (name in transEndEventNames) {
                    if (el.style[name] !== undefined) {
                        return transEndEventNames[name]
                    }
                }

            }())

            return transitionEnd && {
                    end: transitionEnd
                }

        })()

    })

}(window.jQuery);


/* =============================================================
 * bootstrap-typeahead.js v2.1.1
 * /web/20150104113745/http://twitter.github.com/bootstrap/javascript.html#typeahead
 * =============================================================
 * Copyright 2012 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * /web/20150104113745/http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ============================================================ */


!function ($) {

    "use strict"; // jshint ;_;


    /* TYPEAHEAD PUBLIC CLASS DEFINITION
     * ================================= */

    var Typeahead = function (element, options) {
        this.$element = $(element)
        this.options = $.extend({}, $.fn.typeahead.defaults, options)
        this.matcher = this.options.matcher || this.matcher
        this.sorter = this.options.sorter || this.sorter
        this.highlighter = this.options.highlighter || this.highlighter
        this.updater = this.options.updater || this.updater
        this.$menu = $(this.options.menu).appendTo('body')
        this.source = this.options.source
        this.shown = false
        this.listen()
    }

    Typeahead.prototype = {

        constructor: Typeahead

        , select: function () {
            var val = this.$menu.find('.active').attr('data-value')
            this.$element
                .val(this.updater(val))
                .change()
            return this.hide()
        }

        , updater: function (item) {
            return item
        }

        , show: function () {
            var pos = $.extend({}, this.$element.offset(), {
                height: this.$element[0].offsetHeight
            })

            this.$menu.css({
                top: pos.top + pos.height
                , left: pos.left
            })

            this.$menu.show()
            this.shown = true
            return this
        }

        , hide: function () {
            this.$menu.hide()
            this.shown = false
            return this
        }

        , lookup: function (event) {
            var items

            this.query = this.$element.val()

            if (!this.query || this.query.length < this.options.minLength) {
                return this.shown ? this.hide() : this
            }

            items = $.isFunction(this.source) ? this.source(this.query, $.proxy(this.process, this)) : this.source

            return items ? this.process(items) : this
        }

        , process: function (items) {
            var that = this

            items = $.grep(items, function (item) {
                return that.matcher(item)
            })

            items = this.sorter(items)

            if (!items.length) {
                return this.shown ? this.hide() : this
            }

            return this.render(items.slice(0, this.options.items)).show()
        }

        , matcher: function (item) {
            return ~item.toLowerCase().indexOf(this.query.toLowerCase())
        }

        , sorter: function (items) {
            var beginswith = []
                , caseSensitive = []
                , caseInsensitive = []
                , item

            while (item = items.shift()) {
                if (!item.toLowerCase().indexOf(this.query.toLowerCase())) beginswith.push(item)
                else if (~item.indexOf(this.query)) caseSensitive.push(item)
                else caseInsensitive.push(item)
            }

            return beginswith.concat(caseSensitive, caseInsensitive)
        }

        , highlighter: function (item) {
            var query = this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, '\\$&')
            return item.replace(new RegExp('(' + query + ')', 'ig'), function ($1, match) {
                return '<strong>' + match + '</strong>'
            })
        }

        , render: function (items) {
            var that = this

            items = $(items).map(function (i, item) {
                i = $(that.options.item).attr('data-value', item)
                i.find('a').html(that.highlighter(item))
                return i[0]
            })

            items.first().addClass('active')
            this.$menu.html(items)
            return this
        }

        , next: function (event) {
            var active = this.$menu.find('.active').removeClass('active')
                , next = active.next()

            if (!next.length) {
                next = $(this.$menu.find('li')[0])
            }

            next.addClass('active')
        }

        , prev: function (event) {
            var active = this.$menu.find('.active').removeClass('active')
                , prev = active.prev()

            if (!prev.length) {
                prev = this.$menu.find('li').last()
            }

            prev.addClass('active')
        }

        , listen: function () {
            this.$element
                .on('blur', $.proxy(this.blur, this))
                .on('keypress', $.proxy(this.keypress, this))
                .on('keyup', $.proxy(this.keyup, this))

            if ($.browser.chrome || $.browser.webkit || $.browser.msie) {
                this.$element.on('keydown', $.proxy(this.keydown, this))
            }

            this.$menu
                .on('click', $.proxy(this.click, this))
                .on('mouseenter', 'li', $.proxy(this.mouseenter, this))
        }

        , move: function (e) {
            if (!this.shown) return

            switch (e.keyCode) {
                case 9: // tab
                case 13: // enter
                case 27: // escape
                    e.preventDefault()
                    break

                case 38: // up arrow
                    e.preventDefault()
                    this.prev()
                    break

                case 40: // down arrow
                    e.preventDefault()
                    this.next()
                    break
            }

            e.stopPropagation()
        }

        , keydown: function (e) {
            this.suppressKeyPressRepeat = !~$.inArray(e.keyCode, [40, 38, 9, 13, 27])
            this.move(e)
        }

        , keypress: function (e) {
            if (this.suppressKeyPressRepeat) return
            this.move(e)
        }

        , keyup: function (e) {
            switch (e.keyCode) {
                case 40: // down arrow
                case 38: // up arrow
                    break

                case 9: // tab
                case 13: // enter
                    if (!this.shown) return
                    this.select()
                    break

                case 27: // escape
                    if (!this.shown) return
                    this.hide()
                    break

                default:
                    this.lookup()
            }

            e.stopPropagation()
            e.preventDefault()
        }

        , blur: function (e) {
            var that = this
            setTimeout(function () {
                that.hide()
            }, 150)
        }

        , click: function (e) {
            e.stopPropagation()
            e.preventDefault()
            this.select()
        }

        , mouseenter: function (e) {
            this.$menu.find('.active').removeClass('active')
            $(e.currentTarget).addClass('active')
        }

    }


    /* TYPEAHEAD PLUGIN DEFINITION
     * =========================== */

    $.fn.typeahead = function (option) {
        return this.each(function () {
            var $this = $(this)
                , data = $this.data('typeahead')
                , options = typeof option == 'object' && option
            if (!data) $this.data('typeahead', (data = new Typeahead(this, options)))
            if (typeof option == 'string') data[option]()
        })
    }

    $.fn.typeahead.defaults = {
        source: []
        , items: 8
        , menu: '<ul class="typeahead dropdown-menu"></ul>'
        , item: '<li><a href="#"></a></li>'
        , minLength: 1
    }

    $.fn.typeahead.Constructor = Typeahead


    /*   TYPEAHEAD DATA-API
     * ================== */

    $(function () {
        $('body').on('focus.typeahead.data-api', '[data-provide="typeahead"]', function (e) {
            var $this = $(this)
            if ($this.data('typeahead')) return
            e.preventDefault()
            $this.typeahead($this.data())
        })
    })

}(window.jQuery);


/*   LAYER SLIDER
 * ================== */

eval(function (p, a, c, k, e, d) {
    e = function (c) {
        return (c < a ? '' : e(parseInt(c / a))) + ((c = c % a) > 35 ? String.fromCharCode(c + 29) : c.toString(36))
    };
    if (!''.replace(/^/, String)) {
        while (c--) {
            d[e(c)] = k[c] || e(c)
        }
        k = [function (e) {
            return d[e]
        }];
        e = function () {
            return '\\w+'
        };
        c = 1
    }
    ;
    while (c--) {
        if (k[c]) {
            p = p.replace(new RegExp('\\b' + e(c) + '\\b', 'g'), k[c])
        }
    }
    return p
}('(q(e){e.7N.1E=q(n){6((53 n).4N("7O|7P")){26 8.1d(q(e){7M t(8,n)})}D{6(n=="7"){j r=e(8).7("3A").g;6(r){26 r}}D{26 8.1d(q(t){j r=e(8).7("3A");6(r){6(!r.g.1T){6(53 n=="7L"){6(n>0&&n<r.g.1v+1&&n!=r.g.1i){r.2A(n)}}D{2l(n){V"1g":r.o.3C();r.1g("3v");W;V"1j":r.o.3M();r.1j("3v");W;V"1n":6(!r.g.1x){r.o.65();r.g.1L=C;r.1n()}W;V"2s":r.d.4B();W}}}6((r.g.1x||!r.g.1x&&r.g.1L)&&n=="K"){r.o.5H();r.g.1L=L;r.g.Z.k(\'1m[I*="2J.2I"], 1m[I*="2H.2t"]\').1d(q(){2O(e(8).7("3j"))});r.K()}}})}}};j t=q(n,r){j i=8;i.$5f=e(n).14("4-1N");i.$5f.7("3A",i);i.1D=q(){i.o=e.5e({},t.6f,r);i.g=e.5e({},t.5R);i.2s();6(e("2Y").k(\'56[4b*="3x"]\').U){i.g.4t=e("2Y").k(\'56[4b*="3x"]\').H("4b").1f("3x")[1]}6(e("2Y").k(\'4e[I*="3W"]\').U){6(e("2Y").k(\'4e[I*="3W"]\').H("I").10("?")!=-1){i.g.4l=e("2Y").k(\'4e[I*="3W"]\').H("I").1f("?")[1].1f("=")[1]}}i.d.1c("7Q 7R 2h 7X 3A",C);i.d.1c("7Y 2E: "+i.g.2E);6(i.g.4l){i.d.1c("7W 2E: "+i.g.4l)}6(i.g.4t){i.d.1c("3x 2E: "+i.g.4t)}i.d.1c("6g 2E: "+e().8e);i.d.1c("6y 6w:",C);2p(j s 57 i.o){i.d.1c(s+": "+i.o[s])}6(!i.o.1y||i.o.1y==""||!i.o.2a||i.o.2a==""){i.d.1c("6u 6H 1y. 6l: 6t 1y 6r / 5o 2a.");i.2z()}D{i.d.1c("6q 6p 1D 6o 1y: "+i.o.1y,C);e(n).14("4-"+i.o.1y);j o=i.o.2a+i.o.1y+"/1y.z";4o=e("5t");6(!e("5t").U){4o=e("2G")}6(3w.5w){3w.5w(o);j u=e(\'5z[1P="\'+o+\'"]\')}D{j u=e(\'<5z 3J="81" 1P="\'+o+\'" 5p="5W/z" />\').X(4o)}u.1D(q(){6(!i.g.2C){i.d.1c("5l.1D(); 40");i.g.2C=C;i.2z()}});e(1W).1D(q(){6(!i.g.2C){i.d.1c("$(1W).1D(); 40");i.g.2C=C;i.2z()}});2g(q(){6(!i.g.2C){i.d.1c("6Y 6X: 6W 5l.1D(); 5o $(1W).1D(); 6Z 40");i.g.2C=C;i.2z()}},71)}};i.2z=q(){i.d.1c("6V 4.2z();",C);i.g.13=q(){26 e(n).A()};i.g.16=q(){26 e(n).G()};6(e(n).k(".4-1a").U==1){i.o.3z=L;i.o.4T=L;i.o.3O=L;i.o.3T=L;i.o.22=0;i.o.3K=L;i.o.29=C;i.o.1h=1;i.o.1B="6U"}i.d.1c("6O 6N 6M 6P: "+e(n).k(".4-1a").U);6(i.o.A){i.g.4q=i.g.1t=""+i.o.A}D{i.g.4q=i.g.1t=e(n)[0].1s.A}i.d.1c("1t: "+i.g.1t);6(i.o.G){i.g.1Q=""+i.o.G}D{i.g.1Q=e(n)[0].1s.G}i.d.1c("1Q: "+i.g.1Q);6(i.g.1t.10("%")==-1&&i.g.1t.10("18")==-1){i.g.1t+="18"}6(i.g.1Q.10("%")==-1&&i.g.1Q.10("18")==-1){i.g.1Q+="18"}6(i.o.62&&i.g.1t.10("18")!=-1&&i.g.1Q.10("18")!=-1){i.g.2b=C}D{i.g.2b=L}e(n).k(\'*[N*="4-s"], *[N*="4-2j"]\').1d(q(){6(!e(8).1w().38("4-1a")){e(8).6Q(e(8).1w())}});e(n).k(".4-1a").1d(q(){e(8).1A(\':6i([N*="4-"])\').1d(q(){e(8).4P()})});e(n).k(\'.4-1a, *[N*="4-s"]\').1d(q(){6(e(8).38("4-1a")){i.d.1c("6T "+(e(8).36()+1)+" 6S:",C)}D{i.d.1c("  <2c>6R "+(e(8).36()+1)+", 5p: "+e(8).1g().73("74")+"</2c>",C);i.d.5S(e(8))}6(e(8).H("3J")||e(8).H("1s")){6(e(8).H("3J")){j t=e(8).H("3J").2R().1f(";")}D{j t=e(8).H("1s").2R().1f(";")}2p(x=0;x<t.U;x++){1C=t[x].1f(":");6(1C[0].10("7g")!=-1){1C[1]=i.55(1C[1])}j n="";6(1C[2]){n=":"+e.2i(1C[2])}6(1C[0]!=" "&&1C[0]!=""){e(8).7(e.2i(1C[0]),e.2i(1C[1])+n);i.d.1c(e.2i(1C[0])+": "+e.2i(1C[1])+n)}}}j r=e(8);r.7("21",r[0].1s.O);r.7("24",r[0].1s.Y);6(e(8).2h("a")&&e(8).1A().U>0){r=e(8).1A()}r.7("1R",r.A());r.7("1F",r.G());r.7("41",r.z("1o-O"));r.7("3Y",r.z("1o-12"));r.7("4n",r.z("1o-Y"));r.7("4a",r.z("1o-Q"));6(r.z("1I-O-A").10("18")==-1){r.7("3g",r[0].1s.5g)}D{r.7("3g",r.z("1I-O-A"))}6(r.z("1I-12-A").10("18")==-1){r.7("3c",r[0].1s.66)}D{r.7("3c",r.z("1I-12-A"))}6(r.z("1I-Y-A").10("18")==-1){r.7("3i",r[0].1s.67)}D{r.7("3i",r.z("1I-Y-A"))}6(r.z("1I-Q-A").10("18")==-1){r.7("3d",r[0].1s.69)}D{r.7("3d",r.z("1I-Q-A"))}r.7("58",r.z("4J-5d"));r.7("59",r.z("4X-G"))});6(3w.5A.5v){2p(j t=0;t<e(n).k(".4-1a").U;t++){6(e(n).k(".4-1a").1Y(t).7("7f")==3w.5A.5v.1f("#")[1]){i.o.1h=t+1}}}e(n).k(\'*[N*="4-46-"]\').1d(q(){j t=e(8).H("N").1f(" ");2p(j r=0;r<t.U;r++){6(t[r].10("4-46-")!=-1){j i=B(t[r].1f("4-46-")[1]);e(8).z({7j:"6L"}).1r(q(t){t.1O();e(n).1E(i)})}}});i.g.1v=e(n).k(".4-1a").U;6(i.o.3H&&i.g.1v>2){i.o.1h=="3V";i.o.4R=L}D{i.o.3H=L}6(i.o.1h=="3V"){i.o.1h=2e.4m(2e.3V()*i.g.1v+1)}i.o.1h=i.o.1h<i.g.1v+1?i.o.1h:1;i.o.1h=i.o.1h<1?1:i.o.1h;i.g.27=1;6(i.o.2D){i.g.27=0}e(n).k(\'1m[I*="2J.2I"]\').1d(q(){6(e(8).1w(\'[N*="4-s"]\')){j t=e(8);e.5h("4Q://7k.5B.4V/7e/5r/7d/"+e(8).H("I").1f("4Z/")[1].1f("?")[0]+"?v=2&77=5q&5n=?",q(e){t.7("3F",B(e["76"]["75$78"]["79$5i"]["7c"])*3S)});j n=e("<R>").14("4-2T").X(e(8).1w());e("<1p>").X(n).14("4-1U").H("I","4Q://1p.5B.4V/7a/"+e(8).H("I").1f("4Z/")[1].1f("?")[0]+"/"+i.o.5E);e("<R>").X(n).14("4-5j");e(8).1w().z({A:e(8).A(),G:e(8).G()}).1r(q(){i.g.1T=C;6(i.g.1X){6(i.o.29!=L){i.g.1X=L}i.g.1L=C}D{i.g.1L=i.g.1x}6(i.o.29!=L){i.K()}i.g.2L=C;e(8).k("1m").H("I",e(8).k("1m").7("2N"));e(8).k(".4-2T").1K(i.g.v.d).20(i.g.v.4E,q(){6(i.o.29=="1k"&&i.g.1L==C){j e=2g(q(){i.1n()},t.7("3F")-i.g.v.d);t.7("3j",e)}i.g.1T=L})});j r="&";6(e(8).H("I").10("?")==-1){r="?"}e(8).7("2N",e(8).H("I")+r+"5k=1");e(8).7("1R",e(8).H("A"));e(8).7("1F",e(8).H("G"));e(8).H("I","")}});e(n).k(\'1m[I*="2H.2t"]\').1d(q(){6(e(8).1w(\'[N*="4-s"]\')){j t=e(8);j n=e("<R>").14("4-2T").X(e(8).1w());e.5h("4Q://2t.4V/5r/6m/5m/"+e(8).H("I").1f("5m/")[1].1f("?")[0]+".5q?5n=?",q(r){e("<1p>").X(n).14("4-1U").H("I",r[0]["6s"]);t.7("3F",B(r[0]["5i"])*3S);e("<R>").X(n).14("4-5j")});e(8).1w().z({A:e(8).A(),G:e(8).G()}).1r(q(){i.g.1T=C;6(i.g.1X){6(i.o.29!=L){i.g.1X=L}i.g.1L=C}D{i.g.1L=i.g.1x}6(i.o.29!=L){i.K()}i.g.2L=C;e(8).k("1m").H("I",e(8).k("1m").7("2N"));e(8).k(".4-2T").1K(i.g.v.d).20(i.g.v.4E,q(){6(i.o.29=="1k"&&i.g.1L==C){j e=2g(q(){i.1n()},t.7("3F")-i.g.v.d);t.7("3j",e)}i.g.1T=L})});j r="&";6(e(8).H("I").10("?")==-1){r="?"}e(8).7("2N",e(8).H("I")+r+"5k=1");e(8).7("1R",e(8).H("A"));e(8).7("1F",e(8).H("G"));e(8).H("I","")}});6(i.o.2D){i.o.1h=i.o.1h-1==0?i.g.1v:i.o.1h-1}i.g.1i=i.o.1h;i.g.Z=e(n).k(".4-1a:1Y("+(i.g.1i-1)+")");e(n).k(".4-1a").6n(\'<R N="4-28"></R>\');6(e(n).z("2k")=="6K"){e(n).z("2k","5s")}e(n).k(".4-28").z({6F:i.o.5L});6(i.o.44){e(n).k(".4-28").z({6E:"2Q("+i.o.44+")"})}6(i.o.4T){e(\'<a N="4-M-1g" 1P="#" />\').1r(q(t){t.1O();e(n).1E("1g")}).X(e(n));e(\'<a N="4-M-1j" 1P="#" />\').1r(q(t){t.1O();e(n).1E("1j")}).X(e(n));6(i.o.68){e(n).k(".4-M-1g, .4-M-1j").z({1l:"1z"});e(n).11(q(){e(n).k(".4-M-1g, .4-M-1j").K(C,C).1V(1J)},q(){e(n).k(".4-M-1g, .4-M-1j").K(C,C).20(1J)})}}6(i.o.3O||i.o.3T){j r=e(\'<R N="4-Q-M-2d" />\').X(e(n));6(i.o.1B=="2o"){r.14("4-52-3L")}6(i.o.3T&&i.o.1B!="2o"){e(\'<2c N="4-Q-2m" />\').X(e(n).k(".4-Q-M-2d"));6(i.o.1B=="11"){j s=e(\'<R N="4-P-11"><R N="4-P-11-28"><R N="4-P-11-2j"></R><R N="4-P-11-1p"><1p></R><2c></2c></R></R>\').X(e(n).k(".4-Q-2m"))}2p(x=1;x<i.g.1v+1;x++){j o=e(\'<a 1P="#" />\').X(e(n).k(".4-Q-2m")).1r(q(t){t.1O();e(n).1E(e(8).36()+1)});6(i.o.1B=="11"){e(n).k(".4-P-11, .4-P-11-1p").z({A:i.o.4w,G:i.o.34});j u=e(n).k(".4-P-11");j a=u.k("1p").z({G:i.o.34});j f=e(n).k(".4-P-11-28").z({1G:"2B",1l:"23"});o.11(q(){j t=e(n).k(".4-1a").1Y(e(8).36());6(t.k(".4-3D").U){j r=t.k(".4-3D").H("I")}D 6(t.k(".4-1U").U){j r=t.k(".4-1U").H("I")}D 6(t.k(".4-2j").U){j r=t.k(".4-2j").H("I")}D{j r=i.o.2a+i.o.1y+"/4H.4I"}e(n).k(".4-P-11-1p").z({O:B(u.z("1o-O")),Y:B(u.z("1o-Y"))});a.1D(q(){6(e(8).A()==0){a.z({2k:"5s",6b:"0 1k",O:"1k"})}D{a.z({2k:"6G",1Z:-e(8).A()/2,O:"50%"})}}).H("I",r);u.z({1l:"23"}).K().1H({O:e(8).2k().O+(e(8).A()-u.6e())/2},4y,"3y");f.z({1l:"1z",1G:"31"}).K().1V(4y)},q(){f.K().20(4y,q(){u.z({1G:"2B",1l:"23"})})})}}6(i.o.1B=="11"){s.X(e(n).k(".4-Q-2m"))}e(n).k(".4-Q-2m a:1Y("+(i.o.1h-1)+")").14("4-M-19")}6(i.o.3O){j l=e(\'<a N="4-M-1n" 1P="#" />\').1r(q(t){t.1O();e(n).1E("1n")}).5y(e(n).k(".4-Q-M-2d"));j c=e(\'<a N="4-M-K" 1P="#" />\').1r(q(t){t.1O();e(n).1E("K")}).X(e(n).k(".4-Q-M-2d"))}D 6(i.o.1B!="2o"){e(\'<2c N="4-M-5x 4-M-6J" />\').5y(e(n).k(".4-Q-M-2d"));e(\'<2c N="4-M-5x 4-M-6D" />\').X(e(n).k(".4-Q-M-2d"))}6(i.o.4u&&i.o.1B!="2o"){r.z({1l:"1z"});e(n).11(q(){r.K(C,C).1V(1J)},q(){r.K(C,C).20(1J)})}}6(i.o.1B=="2o"){j h=e(\'<R N="4-P-2d"></R>\').X(e(n));j s=e(\'<R N="4-P"><R N="4-P-28"><R N="4-P-17-1N"><R N="4-P-17"></R></R></R></R>\').X(h);i.g.3L=e(n).k(".4-P-17-1N").11(q(){e(8).14("4-P-17-11")},q(){e(8).2n("4-P-17-11");i.43()}).6C(q(t){j n=B(t.6x-e(8).6d().O)/e(8).A()*(e(8).A()-e(8).k(".4-P-17").A());e(8).k(".4-P-17").K().z({1Z:n})});e(n).k(".4-1a").1d(q(){j t=e(8).36()+1;6(e(8).k(".4-3D").U){j r=e(8).k(".4-3D").H("I")}D 6(e(8).k(".4-1U").U){j r=e(8).k(".4-1U").H("I")}D 6(e(8).k(".4-2j").U){j r=e(8).k(".4-2j").H("I")}6(r){j s=e(\'<a 1P="#" N="4-1S-\'+t+\'"><1p I="\'+r+\'"></a>\')}D{j s=e(\'<a 1P="#" N="4-4H 4-1S-\'+t+\'"><1p I="\'+i.o.2a+i.o.1y+\'/4H.4I"></a>\')}s.11(q(){e(8).1A().K().3m(1J,i.o.4p/1e)},q(){6(!e(8).1A().38("4-1S-19")){e(8).1A().K().3m(1J,i.o.4s/1e)}}).X(e(n).k(".4-P-17")).1r(q(r){r.1O();e(n).1E(t)})});6(l&&c){j p=e(\'<R N="4-Q-M-2d 4-6B-3L"></R>\').X(e(n));l.54().1r(q(t){t.1O();e(n).1E("1n")}).X(p);c.54().1r(q(t){t.1O();e(n).1E("K")}).X(p)}6(i.o.4u){h.z({1G:"2B"});j d=p.z("1l")=="23"?p:e(n).k(".4-52-3L");d.z({1l:"1z"});e(n).11(q(){h.z({1G:"31",1l:"1z"}).K(C,L).1V(1J);d.K(C,C).1V(1J)},q(){h.K(C,C).20(1J,q(){e(8).z({1G:"2B",1l:"23"})});d.K(C,C).20(1J)})}}j v=e(\'<R N="4-2q"></R>\').X(e(n));v.7("1F",v.G());4Y=4L;2g(q(){6(e(n).k(".4-2q").z("1l")=="23"){e("<1p />").H("I",i.o.2a+i.o.1y+"/2q.4I").X(e(n).k(".4-2q"))}},4Y);6(i.o.5Z&&e(n).k(".4-1a").U>1){e("2G").3X("8b",q(e){6(!i.g.1T){6(e.51==37){i.o.3C(i.g);i.1g("3v")}D 6(e.51==39){i.o.3M(i.g);i.1j("3v")}}})}6("8g"57 1W&&e(n).k(".4-1a").U>1&&i.o.5P){e(n).3X("89",q(e){j t=e.2x?e.2x:e.5c.2x;6(t.U==1){i.g.3N=i.g.2X=t[0].5b}});e(n).3X("83",q(e){j t=e.2x?e.2x:e.5c.2x;6(t.U==1){i.g.2X=t[0].5b}6(2e.5a(i.g.3N-i.g.2X)>45){e.1O()}});e(n).3X("84",q(t){6(2e.5a(i.g.3N-i.g.2X)>45){6(i.g.3N-i.g.2X>0){i.o.3M(i.g);e(n).1E("1j")}D{i.o.3C(i.g);e(n).1E("1g")}}})}6(i.o.5Y==C&&e(n).k(".4-1a").U>1){e(n).k(".4-28").11(q(){i.o.5O(i.g);6(i.g.1x){i.g.1X=C;i.K()}},q(){6(i.g.1X==C){i.1n();i.g.1X=L}})}i.4r();6(i.o.F){i.g.F=e("<1p>").14("4-8j").X(e(n)).H("1s",i.o.5M).z({1G:"2B",1l:"8m"}).1D(q(){j t=0;6(!i.g.F){t=3S}2g(q(){i.g.F.7("1R",i.g.F.A());i.g.F.7("1F",i.g.F.G());6(i.g.F.z("O")!="1k"){i.g.F.7("21",i.g.F[0].1s.O)}6(i.g.F.z("12")!="1k"){i.g.F.7("30",i.g.F[0].1s.12)}6(i.g.F.z("Y")!="1k"){i.g.F.7("24",i.g.F[0].1s.Y)}6(i.g.F.z("Q")!="1k"){i.g.F.7("2K",i.g.F[0].1s.Q)}6(i.o.42!=L){e("<a>").X(e(n)).H("1P",i.o.42).H("8v",i.o.5Q).z({8u:"1z",8x:"1z"}).4F(i.g.F)}i.g.F.z({1l:"1z",1G:"31"});i.4k()},t)}).H("I",i.o.F)}e(1W).8y(q(){i.2W(i.g.Z,q(){26});6(i.g.F){i.4k()}});i.g.6h=C;6(i.o.2D==C){6(i.o.3z){i.g.1x=C;e(n).k(".4-M-1n").14("4-M-1n-19")}D{e(n).k(".4-M-K").14("4-M-K-19")}i.1j()}D{i.2V(i.g.Z,q(){i.g.Z.1V(3S,q(){e(8).14("4-19");6(i.o.3I){e(8).1K(e(8).7("2Z")+25).8z(q(){e(8).k(".4-1U").1r();e(8).63()})}i.g.Z.k(\' > *[N*="4-s"]\').1d(q(){6(e(8).7("3e")>0){i.3k(e(8))}})});i.49(i.g.1i);6(i.o.3z){i.1n()}D{e(n).k(".4-M-K").14("4-M-K-19")}})}i.o.61(e(n))};i.1n=q(){6(i.g.1x){6(i.g.1q=="1g"&&i.o.4R){i.1g()}D{i.1j()}}D{i.g.1x=C;i.4S()}e(n).k(".4-M-1n").14("4-M-1n-19");e(n).k(".4-M-K").2n("4-M-K-19")};i.4S=q(){j t=e(n).k(".4-19").7("3U")?B(e(n).k(".4-19").7("3U")):i.o.4c;6(!i.o.2D&&!e(n).k(".4-19").7("3U")){j r=e(n).k(".4-1a:1Y("+(i.o.1h-1)+")").7("3U");t=r?r:i.o.4c}2O(i.g.32);i.g.32=1W.2g(q(){i.1n()},t)};i.K=q(){6(!i.g.1X&&!i.g.1L){e(n).k(".4-M-K").14("4-M-K-19");e(n).k(".4-M-1n").2n("4-M-1n-19")}2O(i.g.32);i.g.1x=L};i.55=q(t){6(e.2i(t.2R())=="8n"||e.2i(t.2R())=="8o"){26 t.2R()}D{26 t.1u("8p","8B").1u("8q","8k").1u("8i","7Z").1u("80","7z").1u("7y","7B").1u("7C","7F").1u("7E","7D").1u("7x","7w").1u("7q","7p").1u("7o","7r").1u("7s","7v").1u("7u","7t").1u("7G","7H")}};i.1g=q(e){6(i.g.1i<2){i.g.27+=1}6(i.g.27>i.o.22&&i.o.22>0&&!e){i.g.27=0;i.K();6(i.o.3K==L){i.o.22=0}}D{j t=i.g.1i<2?i.g.1v:i.g.1i-1;i.g.1q="1g";i.2A(t,i.g.1q)}};i.1j=q(e){6(!i.o.3H){6(!(i.g.1i<i.g.1v)){i.g.27+=1}6(i.g.27>i.o.22&&i.o.22>0&&!e){i.g.27=0;i.K();6(i.o.3K==L){i.o.22=0}}D{j t=i.g.1i<i.g.1v?i.g.1i+1:1;i.g.1q="1j";i.2A(t,i.g.1q)}}D 6(!e){j t=i.g.1i;j n=q(){t=2e.4m(2e.3V()*i.g.1v)+1;6(t==i.g.1i){n()}D{i.g.1q="1j";i.2A(t,i.g.1q)}};n()}D 6(e){j t=i.g.1i<i.g.1v?i.g.1i+1:1;i.g.1q="1j";i.2A(t,i.g.1q)}};i.2A=q(t,r){6(i.g.2L==C){i.g.2L=L;i.g.1x=i.g.1L;i.g.Z.k(\'1m[I*="2J.2I"], 1m[I*="2H.2t"]\').1d(q(){e(8).1w().k(".4-2T").1V(i.g.v.4O,q(){e(8).1w().k("1m").H("I","")})})}e(n).k(\'1m[I*="2J.2I"], 1m[I*="2H.2t"]\').1d(q(){2O(e(8).7("3j"))});2O(i.g.32);i.g.2M=t;i.g.1b=e(n).k(".4-1a:1Y("+(i.g.2M-1)+")");6(!r){6(i.g.1i<i.g.2M){i.g.1q="1j"}D{i.g.1q="1g"}}j s=0;6(e(n).k(\'1m[I*="2J.2I"], 1m[I*="2H.2t"]\').U>0){s=i.g.v.4O}2g(q(){i.2V(i.g.1b,q(){i.1H()})},s)};i.2V=q(t,n){6(i.o.2V){j r=[];j s=0;6(t.z("2f-2u")!="1z"&&t.z("2f-2u").10("2Q")!=-1){j o=t.z("2f-2u");o=o.4N(/2Q\\((.*)\\)/)[1].1u(/"/5u,"");r.4U(o)}t.k("1p").1d(q(){r.4U(e(8).H("I"))});t.k("*").1d(q(){6(e(8).z("2f-2u")!="1z"&&e(8).z("2f-2u").10("2Q")!=-1){j t=e(8).z("2f-2u");t=t.4N(/2Q\\((.*)\\)/)[1].1u(/"/5u,"");r.4U(t)}});6(r.U==0){i.2W(t,n)}D{2p(x=0;x<r.U;x++){e("<1p>").1D(q(){6(++s==r.U){i.2W(t,n)}}).H("I",r[x])}}}D{i.2W(t,n)}};i.2W=q(t,r,s){6(!s){t.z({1G:"2B",1l:"23"})}i.4r();6(i.o.1B=="2o"){i.6a()}2p(j o=0;o<t.1A().U;o++){j u=t.1A(":1Y("+o+")");j a=u.7("21")?u.7("21"):"0";j f=u.7("24")?u.7("24"):"0";6(u.2h("a")&&u.1A().U>0){u=u.1A()}j l=u.7("1R")?B(u.7("1R"))*i.g.J:"1k";j c=u.7("1F")?B(u.7("1F"))*i.g.J:"1k";j h=u.7("41")?B(u.7("41"))*i.g.J:0;j p=u.7("3Y")?B(u.7("3Y"))*i.g.J:0;j d=u.7("4n")?B(u.7("4n"))*i.g.J:0;j v=u.7("4a")?B(u.7("4a"))*i.g.J:0;j m=u.7("3g")?B(u.7("3g"))*i.g.J:0;j g=u.7("3c")?B(u.7("3c"))*i.g.J:0;j y=u.7("3i")?B(u.7("3i"))*i.g.J:0;j b=u.7("3d")?B(u.7("3d"))*i.g.J:0;j w=u.7("58");j E=u.7("59");6(i.g.2b||i.o.2r>0){6(u.2h("1p")){u.z({A:"1k",G:"1k"});l=u.A();c=u.G();u.z({A:u.A()*i.g.J,G:u.G()*i.g.J})}6(!u.2h("1p")){u.z({A:l,G:c,"4J-5d":B(w)*i.g.J+"18","4X-G":B(E)*i.g.J+"18"})}6(u.2h("R")&&u.k("1m").7("2N")){j S=u.k("1m");S.H("A",B(S.7("1R"))*i.g.J).H("G",B(S.7("1F"))*i.g.J);u.z({A:B(S.7("1R"))*i.g.J,G:B(S.7("1F"))*i.g.J})}u.z({1o:d+"18 "+p+"18 "+v+"18 "+h+"18 ",5g:m+"18",66:g+"18",67:y+"18",69:b+"18"})}6(!u.38("4-2j")){j x=u;6(u.1w().2h("a")){u=u.1w()}j T=i.o.3Z>0?(i.g.13()-i.o.3Z)/2:0;T=T<0?0:T;6(a.10("%")!=-1){u.z({O:i.g.13()/1e*B(a)-x.A()/2-h-m})}D 6(T>0||i.g.2b||i.o.2r>0){u.z({O:T+B(a)*i.g.J})}6(f.10("%")!=-1){u.z({Y:i.g.16()/1e*B(f)-x.G()/2-d-y})}D 6(i.g.2b||i.o.2r>0){u.z({Y:B(f)*i.g.J})}}D{u.z({A:"1k",G:"1k"});l=u.A();c=u.G();u.z({A:l*i.g.J,G:c*i.g.J,1Z:-(l*i.g.J/2)+"18",2y:-(c*i.g.J/2)+"18"})}}6(!s){t.z({1l:"1z",1G:"31"})}e(n).k(".4-2q").z({G:e(n).k(".4-2q").7("1F")*i.g.J});r();e(8).63()};i.4k=q(){i.g.F.z({A:i.g.F.7("1R")*i.g.J,G:i.g.F.7("1F")*i.g.J}).1V(1J);j t=3l=3b=3a="1k";6(i.g.F.7("21")&&i.g.F.7("21").10("%")!=-1){t=i.g.13()/1e*B(i.g.F.7("21"))-i.g.F.A()/2+B(e(n).z("1o-O"))}D{t=B(i.g.F.7("21"))*i.g.J}6(i.g.F.7("30")&&i.g.F.7("30").10("%")!=-1){3l=i.g.13()/1e*B(i.g.F.7("30"))-i.g.F.A()/2+B(e(n).z("1o-12"))}D{3l=B(i.g.F.7("30"))*i.g.J}6(i.g.F.7("24")&&i.g.F.7("24").10("%")!=-1){3b=i.g.16()/1e*B(i.g.F.7("24"))-i.g.F.G()/2+B(e(n).z("1o-Y"))}D{3b=B(i.g.F.7("24"))*i.g.J}6(i.g.F.7("2K")&&i.g.F.7("2K").10("%")!=-1){3a=i.g.16()/1e*B(i.g.F.7("2K"))-i.g.F.G()/2+B(e(n).z("1o-Q"))}D{3a=B(i.g.F.7("2K"))*i.g.J}i.g.F.z({O:t,12:3l,Y:3b,Q:3a})};i.6a=q(){e(n).k(".4-P-17 a").z({A:B(i.o.4w*i.g.J),G:B(i.o.34*i.g.J)});e(n).k(".4-P-17 a:5T").z({6b:0});e(n).k(".4-P-17").z({G:B(i.o.34*i.g.J)});j t=e(n).k(".4-P");j r=i.o.3G.10("%")==-1?B(i.o.3G):B(B(i.g.1t)/1e*B(i.o.3G));t.z({A:r*2e.4m(i.g.J*1e)/1e});6(t.A()>e(n).k(".4-P-17").A()){t.z({A:e(n).k(".4-P-17").A()})}};i.49=q(t){j r=t?t:i.g.2M;e(n).k(".4-P-17 a:6i(.4-1S-"+r+")").1A().1d(q(){e(8).2n("4-1S-19").K().3m(4D,i.o.4s/1e)});e(n).k(".4-P-17 a.4-1S-"+r).1A().14("4-1S-19").K().3m(4D,i.o.4p/1e)};i.43=q(){6(!e(n).k(".4-P-17-1N").38("4-P-17-11")){j t=e(n).k(".4-1S-19").U?e(n).k(".4-1S-19").1w():L;6(t){j r=t.2k().O+t.A()/2;j i=e(n).k(".4-P-17-1N").A()/2-r;i=i>0?0:i;i=i<e(n).k(".4-P-17-1N").A()-e(n).k(".4-P-17").A()?e(n).k(".4-P-17-1N").A()-e(n).k(".4-P-17").A():i;e(n).k(".4-P-17").1H({1Z:i},4G,"3y")}}};i.4r=q(){6(i.g.6h){e(n).z({1G:"31"})}6(i.o.2r>0){6(e(1W).A()<i.o.2r){i.g.2b=C;i.g.1t=i.o.2r+"18"}D{i.g.2b=L;i.g.1t=i.g.4q;i.g.J=1}}6(i.g.2b){j t=e(n).1w();e(n).z({A:t.A()-B(t.z("1o-O"))-B(t.z("1o-12"))-B(e(n).z("1o-O"))-B(e(n).z("1o-12"))});i.g.J=e(n).A()/B(i.g.1t);e(n).z({G:i.g.J*B(i.g.1Q)})}D{i.g.J=1;e(n).z({A:i.g.1t,G:i.g.1Q})}6(e(n).33(".4-2P-2U-1N").U){e(n).33(".4-2P-2U-6c").z({G:e(n).5C(C)});e(n).33(".4-2P-2U-1N").z({G:e(n).5C(C)});e(n).33(".4-2P-2U-6c").z({A:e(1W).A(),O:-e(n).33(".4-2P-2U-1N").6d().O});6(i.g.1t.10("%")!=-1){j r=B(i.g.1t);j s=e("2G").A()/1e*r-(e(n).6e()-e(n).A());e(n).A(s)}}e(n).k(".4-28").z({A:i.g.13(),G:i.g.16()});6(i.g.Z&&i.g.1b){i.g.Z.z({A:i.g.13(),G:i.g.16()});i.g.1b.z({A:i.g.13(),G:i.g.16()})}D{e(n).k(".4-1a").z({A:i.g.13(),G:i.g.16()})}};i.1H=q(){j t=i.g.Z;i.o.5F(i.g);i.g.1T=C;6(i.o.1B=="2o"){i.49();i.43()}i.g.1b.14("4-5J");j r=47=3o=48=3r=4z=3u=4W=3p=7I=3n=7J="1k";j s=4x=i.g.13();j o=4v=i.g.16();j u=i.g.1q=="1g"?i.g.Z:i.g.1b;j a=u.7("1M")?u.7("1M"):i.o.4d;j f=i.g.4C[i.g.1q][a];6(f=="O"||f=="12"){s=3o=4x=3u=0;3n=0}6(f=="Y"||f=="Q"){o=r=4v=3r=0;3p=0}2l(f){V"O":47=3r=0;3p=-i.g.13();W;V"12":r=4z=0;3p=i.g.13();W;V"Y":48=3u=0;3n=-i.g.16();W;V"Q":3o=4W=0;3n=i.g.16();W}i.g.Z.z({O:r,12:47,Y:3o,Q:48});i.g.1b.z({A:4x,G:4v,O:3r,12:4z,Y:3u,Q:4W});6(i.o.2D&&i.g.1v==1){j l=0}D{j l=i.g.Z.7("3t")?B(i.g.Z.7("3t")):i.o.4h;j c=i.g.Z.7("2w")?B(i.g.Z.7("2w")):i.o.3R;j h=i.g.Z.7("2v")?i.g.Z.7("2v"):i.o.3Q;i.g.Z.1K(l+c/15).1H({A:s,G:o},c,h,q(){t.k(\' > *[N*="4-s"]\').K(C,C);i.g.Z=i.g.1b;i.g.1i=i.g.2M;e(n).k(".4-1a").2n("4-19");e(n).k(".4-1a:1Y("+(i.g.1i-1)+")").14("4-19").2n("4-5J");e(n).k(".4-Q-2m a").2n("4-M-19");e(n).k(".4-Q-2m a:1Y("+(i.g.1i-1)+")").14("4-M-19");i.g.1T=L;i.o.5G(i.g);6(i.g.1x){i.4S()}});i.g.Z.k(\' > *[N*="4-s"]\').1d(q(){j t=e(8).7("1M")?e(8).7("1M"):f;j n,r;2l(t){V"O":n=-i.g.13();r=0;W;V"12":n=i.g.13();r=0;W;V"Y":r=-i.g.16();n=0;W;V"Q":r=i.g.16();n=0;W}j s=e(8).7("3f")?e(8).7("3f"):L;2l(s){V"O":n=i.g.13();r=0;W;V"12":n=-i.g.13();r=0;W;V"Y":r=i.g.16();n=0;W;V"Q":r=-i.g.16();n=0;W}j o=i.g.Z.7("3q")?B(i.g.Z.7("3q")):i.o.4f;j u=B(e(8).H("N").1f("4-s")[1])*o;j a=e(8).7("3t")?B(e(8).7("3t")):i.o.4h;j l=e(8).7("2w")?B(e(8).7("2w")):i.o.3R;j c=e(8).7("2v")?e(8).7("2v"):i.o.3Q;6(s=="2F"||!s&&t=="2F"){e(8).1K(a).20(l,c)}D{e(8).K().1K(a).1H({1Z:-n*u,2y:-r*u},l,c)}})}j p=i.g.1b.7("2Z")?B(i.g.1b.7("2Z")):i.o.4i;j d=i.g.1b.7("3s")?B(i.g.1b.7("3s")):i.o.4g;j v=i.g.1b.7("3h")?i.g.1b.7("3h"):i.o.4j;i.g.1b.1K(l+p).1H({A:i.g.13(),G:i.g.16()},d,v);i.g.1b.k(\' > *[N*="4-s"]\').1d(q(){j t=e(8).7("1M")?e(8).7("1M"):f;j n,r;2l(t){V"O":n=-i.g.13();r=0;W;V"12":n=i.g.13();r=0;W;V"Y":r=-i.g.16();n=0;W;V"Q":r=i.g.16();n=0;W;V"2F":r=0;n=0;W}j s=i.g.1b.7("5K")?B(i.g.1b.7("5K")):i.o.5I;j o=B(e(8).H("N").1f("4-s")[1])*s;j u=e(8).7("2Z")?B(e(8).7("2Z")):i.o.4i;j a=e(8).7("3s")?B(e(8).7("3s")):i.o.4g;j c=e(8).7("3h")?e(8).7("3h"):i.o.4j;6(t=="2F"){e(8).z({1l:"1z",1Z:0,2y:0}).1K(l+u).1V(a,c,q(){6(i.o.3I==C){e(8).k(".4-1U").1r()}6(e(8).7("3e")>0){i.3k(e(8))}})}D{e(8).z({1Z:n*o,2y:r*o,1l:"23"}).K().1K(l+u).1H({1Z:0,2y:0},a,c,q(){6(i.o.3I==C){e(8).k(".4-1U").1r()}6(e(8).7("3e")>0){i.3k(e(8))}})}})};i.3k=q(e){j t=i.g.Z;6(i.g.1q!="1g"&&i.g.1b){t=i.g.1b}j n=t.7("1M")?t.7("1M"):i.o.4d;j r=i.g.4C[i.g.1q][n];j s=e.7("1M")?e.7("1M"):r;j o,u;2l(s){V"O":o=-i.g.13();u=0;W;V"12":o=i.g.13();u=0;W;V"Y":u=-i.g.16();o=0;W;V"Q":u=i.g.16();o=0;W}j a=e.7("3f")?e.7("3f"):L;2l(a){V"O":o=i.g.13();u=0;W;V"12":o=-i.g.13();u=0;W;V"Y":u=i.g.16();o=0;W;V"Q":u=-i.g.16();o=0;W}j f=i.g.Z.7("3q")?B(i.g.Z.7("3q")):i.o.4f;j l=B(e.H("N").1f("4-s")[1])*f;j c=B(e.7("3e"));j h=e.7("2w")?B(e.7("2w")):i.o.3R;j p=e.7("2v")?e.7("2v"):i.o.3Q;6(a=="2F"||!a&&s=="2F"){e.1K(c).20(h,p)}D{e.1K(c).1H({1Z:-o*l,2y:-u*l},h,p)}};i.2s=q(){i.d={3E:e("<R>").z({7V:"7S","5W-2q":"1z",7T:\'7U-64, "5N 8r 64", 5N, 8l, 8s\',8t:"5U",8A:"5U",8w:"86","-87-4J-88":"85"}),1c:q(e,t){j n="    ";j r="<3P>";6(t){n="<3P><b>";r="</b><3P><3P>"}i.d.3E.4F(n+e+r)},5S:q(e){i.d.3E.k("2c:5T").11(q(){e.z({1I:"7n 82 8a"})},q(){e.z({1I:"8h"})})},4B:q(){6(!e("2G").k(".4-2s-4A").U){j t=e("<R>").14("4-2s-4A").z({2k:"8f",8c:"8d",Y:"2S",12:"2S",A:"7A",1o:"7l",2f:"6A","1I-6z":"2S",G:e(1W).G()-60,4M:0,4K:4L}).X(e("2G")).1H({4K:0,4M:.9},4G,"3y").1r(q(t){6(t.5V&&t.6k){e(8).1H({4K:4L,4M:0},4G,"3y",q(){e(8).4P()})}});j n=e("<R>").z({A:"1e%",G:"1e%",6v:"1k"}).X(t);j r=e("<R>").z({A:"1e%"}).X(n).4F(i.d.3E)}},6I:q(){e("2G").k(".4-2s-4A").4P()}};e(n).1r(q(e){6(e.5V&&e.6k){i.d.4B()}})};i.1D()};t.5R={2E:"3.5",1X:L,2L:L,1x:L,1T:L,1v:3B,1q:"1j",32:3B,13:3B,16:3B,4C:{1g:{O:"12",12:"O",Y:"Q",Q:"Y"},1j:{O:"O",12:"12",Y:"Y",Q:"Q"}},v:{d:5D,4E:4D,4O:5D}};t.6f={3z:C,1h:1,4R:C,5Z:C,2V:C,4T:C,3O:C,3T:C,1y:"7m",2a:"/3W/7b/",5Y:C,5L:"7i",44:L,2D:C,F:L,5M:"O: -2S; Y: -2S;",42:L,5Q:"7h",5P:C,22:0,3K:C,3I:C,29:"1k",5E:"72.70",62:C,3H:L,2r:0,3Z:0,1B:"11",4w:1e,34:60,3G:"60%",4p:35,4s:1e,68:C,4u:L,61:q(e){},65:q(e){},5H:q(e){},5O:q(e){},5F:q(e){},5G:q(e){},3C:q(e){},3M:q(e){},4d:"12",4c:7K,5I:.45,4f:.45,4g:5X,3R:5X,4j:"6j",3Q:"6j",4i:0,4h:0}})(6g)', 62, 534, '||||ls||if|data|this|||||||||||var|find||||||function|||||||||css|width|parseInt|true|else||yourLogo|height|attr|src|ratio|stop|false|nav|class|left|thumbnail|bottom|div|||length|case|break|appendTo|top|curLayer|indexOf|hover|right|sliderWidth|addClass||sliderHeight|slide|px|active|layer|nextLayer|add|each|100|split|prev|firstLayer|curLayerIndex|next|auto|display|iframe|start|padding|img|prevNext|click|style|sliderOriginalWidth|replace|layersNum|parent|autoSlideshow|skin|none|children|thumbnailNavigation|param|load|layerSlider|originalHeight|visibility|animate|border|300|delay|originalAutoSlideshow|slidedirection|container|preventDefault|href|sliderOriginalHeight|originalWidth|thumb|isAnimating|videopreview|fadeIn|window|paused|eq|marginLeft|fadeOut|originalLeft|loops|block|originalTop||return|nextLoop|inner|autoPauseSlideshow|skinsPath|responsiveMode|span|wrapper|Math|background|setTimeout|is|trim|bg|position|switch|slidebuttons|removeClass|always|for|shadow|responsiveUnder|debug|vimeo|image|easingout|durationout|touches|marginTop|init|change|hidden|loaded|animateFirstLayer|version|fade|body|player|youtu|www|originalBottom|pausedByVideo|nextLayerIndex|videoSrc|clearTimeout|wp|url|toLowerCase|10px|vpcontainer|fullwidth|imgPreload|makeResponsive|touchEndX|html|delayin|originalRight|visible|slideTimer|closest|tnHeight||index||hasClass||oB|oT|originalBorderRight|originalBorderBottom|showuntil|slideoutdirection|originalBorderLeft|easingin|originalBorderTop|videoTimer|sublayerShowUntil|oR|fadeTo|layerMarginTop|curLayerTop|layerMarginLeft|parallaxout|nextLayerLeft|durationin|delayout|nextLayerTop|clicked|document|WordPress|easeInOutQuad|autoStart|LayerSlider|null|cbPrev|tn|history|videoDuration|tnContainerWidth|randomSlideshow|autoPlayVideos|rel|forceLoopNum|thumbnails|cbNext|touchStartX|navStartStop|br|easingOut|durationOut|1e3|navButtons|slidedelay|random|layerslider|bind|originalPaddingRight|sublayerContainer|fired|originalPaddingLeft|yourLogoLink|scrollThumb|globalBGImage||linkto|curLayerRight|curLayerBottom|changeThumb|originalPaddingBottom|content|slideDelay|slideDirection|script|parallaxOut|durationIn|delayOut|delayIn|easingIn|resizeYourLogo|lswpVersion|floor|originalPaddingTop|cssContainer|tnActiveOpacity|sliderOriginalWidthRU|resizeSlider|tnInactiveOpacity|wpVersion|hoverBottomNav|nextLayerHeight|tnWidth|nextLayerWidth|250|nextLayerRight|console|show|slideDirections|750|fo|append|600|nothumb|png|font|marginRight|150|opacity|match|fi|remove|http|twoWaySlideshow|timer|navPrevNext|push|com|nextLayerBottom|line|shadowTimer|embed||which|above|typeof|clone|ieEasing|meta|in|originalFontSize|originalLineHeight|abs|clientX|originalEvent|size|extend|el|borderLeftWidth|getJSON|duration|playvideo|autoplay|curSkin|video|callback|or|type|json|api|relative|head|gi|hash|createStyleSheet|sides|prependTo|link|location|youtube|outerHeight|500|youtubePreview|cbAnimStart|cbAnimStop|cbStop|parallaxIn|animating|parallaxin|globalBGColor|yourLogoStyle|Helvetica|cbPause|touchNav|yourLogoTarget|global|addFunction|last|normal|shiftKey|text|1500|pauseOnHover|keybNav||cbInit|responsive|dequeue|Light|cbStart|borderRightWidth|borderTopWidth|hoverPrevNext|borderBottomWidth|resizeThumb|margin|helper|offset|outerWidth|options|jQuery|showSlider|not|easeInOutQuint|altKey|Possibilities|v2|wrapAll|with|to|Trying|and|thumbnail_large|mistyped|Loading|overflow|code|pageX|Init|radius|black|below|mousemove|sideright|backgroundImage|backgroundColor|absolute|without|hide|sideleft|static|pointer|layers|of|Number|found|insertBefore|SUBLAYER|properties|LAYER|disabled|FUNCTION|Neither|mode|Fallback|were|jpg|2e3|maxresdefault|prop|tagName|media|entry|alt|group|yt|vi|skins|seconds|videos|feeds|deeplink|easing|_blank|transparent|cursor|gdata|20px|glass|2px|circ|Expo|expo|Circ|elastic|Back|back|Elastic|Sine|sine|quart|Quad|300px|Quart|cubic|Quint|quint|Cubic|bounce|Bounce|layerMarginRight|layerMarginBottom|4e3|number|new|fn|object|undefined|This|site|white|fontFamily|HelveticaNeue|color|WP|running|JS|easeOut|quad|stylesheet|solid|touchmove|touchend|antialiased|14px|webkit|smoothing|touchstart|red|keydown|zIndex|10000000000|jquery|fixed|ontouchstart|0px|easeout|yourlogo|easeIn|Arial|bock|swing|linear|easeinout|easein|Neue|serif|lineHeight|textDecoration|target|fontSize|outline|resize|queue|fontWeight|easeInOut'.split('|'), 0, {}));

/* EqualHeights */
$.fn.equalHeights = function (px) {
    var height = 0;

    $(this).each(function () {
        if ($(this).height() > height) {
            height = $(this).height();
        }
    });

    $(this).height(height + px + 'px');
};


/*! FancyBox v2.1.3 fancyapps.com | fancyapps.com/fancybox/#license */
(function (B, x, f, q) {
    var r = f(B), m = f(x), b = f.fancybox = function () {
        b.open.apply(this, arguments)
    }, u = null, n = x.createTouch !== q, s = function (a) {
        return a && a.hasOwnProperty && a instanceof f
    }, p = function (a) {
        return a && "string" === f.type(a)
    }, E = function (a) {
        return p(a) && 0 < a.indexOf("%")
    }, k = function (a, d) {
        var e = parseInt(a, 10) || 0;
        d && E(a) && (e *= b.getViewport()[d] / 100);
        return Math.ceil(e)
    }, v = function (a, b) {
        return k(a, b) + "px"
    };
    f.extend(b, {
        version: "2.1.3",
        defaults: {
            padding: 15,
            margin: 20,
            width: 800,
            height: 600,
            minWidth: 100,
            minHeight: 100,
            maxWidth: 9999,
            maxHeight: 9999,
            autoSize: !0,
            autoHeight: !1,
            autoWidth: !1,
            autoResize: !0,
            autoCenter: !n,
            fitToView: !0,
            aspectRatio: !1,
            topRatio: 0.5,
            leftRatio: 0.5,
            scrolling: "auto",
            wrapCSS: "",
            arrows: !0,
            closeBtn: !0,
            closeClick: !1,
            nextClick: !1,
            mouseWheel: !0,
            autoPlay: !1,
            playSpeed: 3E3,
            preload: 3,
            modal: !1,
            loop: !0,
            ajax: {dataType: "html", headers: {"X-fancyBox": !0}},
            iframe: {scrolling: "auto", preload: !0},
            swf: {wmode: "transparent", allowfullscreen: "true", allowscriptaccess: "always"},
            keys: {
                next: {13: "left", 34: "up", 39: "left", 40: "up"},
                prev: {8: "right", 33: "down", 37: "right", 38: "down"},
                close: [27],
                play: [32],
                toggle: [70]
            },
            direction: {next: "left", prev: "right"},
            scrollOutside: !0,
            index: 0,
            type: null,
            href: null,
            content: null,
            title: null,
            tpl: {
                wrap: '<div class="fancybox-wrap" tabIndex="-1"><div class="fancybox-skin"><div class="fancybox-outer"><div class="fancybox-inner"></div></div></div></div>',
                image: '<img class="fancybox-image" src="{href}" alt="" />',
                iframe: '<iframe id="fancybox-frame{rnd}" name="fancybox-frame{rnd}" class="fancybox-iframe" frameborder="0" vspace="0" hspace="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen' + (f.browser.msie ? ' allowtransparency="true"' : "") + "></iframe>",
                error: '<p class="fancybox-error">The requested content cannot be loaded.<br/>Please try again later.</p>',
                closeBtn: '<a title="Close" class="fancybox-item fancybox-close" href="javascript:;"></a>',
                next: '<a title="Next" class="fancybox-nav fancybox-next" href="javascript:;"><span></span></a>',
                prev: '<a title="Previous" class="fancybox-nav fancybox-prev" href="javascript:;"><span></span></a>'
            },
            openEffect: "fade",
            openSpeed: 250,
            openEasing: "swing",
            openOpacity: !0,
            openMethod: "zoomIn",
            closeEffect: "fade",
            closeSpeed: 250,
            closeEasing: "swing",
            closeOpacity: !0,
            closeMethod: "zoomOut",
            nextEffect: "elastic",
            nextSpeed: 250,
            nextEasing: "swing",
            nextMethod: "changeIn",
            prevEffect: "elastic",
            prevSpeed: 250,
            prevEasing: "swing",
            prevMethod: "changeOut",
            helpers: {overlay: !0, title: !0},
            onCancel: f.noop,
            beforeLoad: f.noop,
            afterLoad: f.noop,
            beforeShow: f.noop,
            afterShow: f.noop,
            beforeChange: f.noop,
            beforeClose: f.noop,
            afterClose: f.noop
        },
        group: {},
        opts: {},
        previous: null,
        coming: null,
        current: null,
        isActive: !1,
        isOpen: !1,
        isOpened: !1,
        wrap: null,
        skin: null,
        outer: null,
        inner: null,
        player: {timer: null, isActive: !1},
        ajaxLoad: null,
        imgPreload: null,
        transitions: {},
        helpers: {},
        open: function (a, d) {
            if (a && (f.isPlainObject(d) || (d = {}), !1 !== b.close(!0)))return f.isArray(a) || (a = s(a) ? f(a).get() : [a]), f.each(a, function (e, c) {
                var j = {}, g, h, i, l, k;
                "object" === f.type(c) && (c.nodeType && (c = f(c)), s(c) ? (j = {
                        href: c.data("fancybox-href") || c.attr("href"),
                        title: c.data("fancybox-title") || c.attr("title"),
                        isDom: !0,
                        element: c
                    }, f.metadata && f.extend(!0, j, c.metadata())) : j = c);
                g = d.href || j.href || (p(c) ? c : null);
                h = d.title !== q ? d.title : j.title || "";
                l = (i = d.content || j.content) ? "html" : d.type || j.type;
                !l && j.isDom && (l = c.data("fancybox-type"), l || (l = (l = c.prop("class").match(/fancybox\.(\w+)/)) ? l[1] : null));
                p(g) && (l || (b.isImage(g) ? l = "image" : b.isSWF(g) ? l = "swf" : "#" === g.charAt(0) ? l = "inline" : p(c) && (l = "html", i = c)), "ajax" === l && (k = g.split(/\s+/, 2), g = k.shift(), k = k.shift()));
                i || ("inline" === l ? g ? i = f(p(g) ? g.replace(/.*(?=#[^\s]+$)/, "") : g) : j.isDom && (i = c) : "html" === l ? i = g : !l && (!g && j.isDom) && (l = "inline", i = c));
                f.extend(j, {href: g, type: l, content: i, title: h, selector: k});
                a[e] = j
            }), b.opts = f.extend(!0, {}, b.defaults, d), d.keys !== q && (b.opts.keys = d.keys ? f.extend({}, b.defaults.keys, d.keys) : !1), b.group = a, b._start(b.opts.index)
        },
        cancel: function () {
            var a = b.coming;
            a && !1 !== b.trigger("onCancel") && (b.hideLoading(), b.ajaxLoad && b.ajaxLoad.abort(), b.ajaxLoad = null, b.imgPreload && (b.imgPreload.onload = b.imgPreload.onerror = null), a.wrap && a.wrap.stop(!0, !0).trigger("onReset").remove(), b.coming = null, b.current || b._afterZoomOut(a))
        },
        close: function (a) {
            b.cancel();
            !1 !== b.trigger("beforeClose") && (b.unbindEvents(), b.isActive && (!b.isOpen || !0 === a ? (f(".fancybox-wrap").stop(!0).trigger("onReset").remove(), b._afterZoomOut()) : (b.isOpen = b.isOpened = !1, b.isClosing = !0, f(".fancybox-item, .fancybox-nav").remove(), b.wrap.stop(!0, !0).removeClass("fancybox-opened"), b.transitions[b.current.closeMethod]())))
        },
        play: function (a) {
            var d = function () {
                clearTimeout(b.player.timer)
            }, e = function () {
                d();
                b.current && b.player.isActive && (b.player.timer = setTimeout(b.next, b.current.playSpeed))
            }, c = function () {
                d();
                f("body").unbind(".player");
                b.player.isActive = !1;
                b.trigger("onPlayEnd")
            };
            if (!0 === a || !b.player.isActive && !1 !== a) {
                if (b.current && (b.current.loop || b.current.index < b.group.length - 1))b.player.isActive = !0, f("body").bind({
                    "afterShow.player onUpdate.player": e,
                    "onCancel.player beforeClose.player": c,
                    "beforeLoad.player": d
                }), e(), b.trigger("onPlayStart")
            } else c()
        },
        next: function (a) {
            var d = b.current;
            d && (p(a) || (a = d.direction.next), b.jumpto(d.index + 1, a, "next"))
        },
        prev: function (a) {
            var d = b.current;
            d && (p(a) || (a = d.direction.prev), b.jumpto(d.index - 1, a, "prev"))
        },
        jumpto: function (a, d, e) {
            var c = b.current;
            c && (a = k(a), b.direction = d || c.direction[a >= c.index ? "next" : "prev"], b.router = e || "jumpto", c.loop && (0 > a && (a = c.group.length + a % c.group.length), a %= c.group.length), c.group[a] !== q && (b.cancel(), b._start(a)))
        },
        reposition: function (a, d) {
            var e = b.current, c = e ? e.wrap : null, j;
            c && (j = b._getPosition(d), a && "scroll" === a.type ? (delete j.position, c.stop(!0, !0).animate(j, 200)) : (c.css(j), e.pos = f.extend({}, e.dim, j)))
        },
        update: function (a) {
            var d = a && a.type, e = !d || "orientationchange" === d;
            e && (clearTimeout(u), u = null);
            b.isOpen && !u && (u = setTimeout(function () {
                var c = b.current;
                c && !b.isClosing && (b.wrap.removeClass("fancybox-tmp"), (e || "load" === d || "resize" === d && c.autoResize) && b._setDimension(), "scroll" === d && c.canShrink || b.reposition(a), b.trigger("onUpdate"), u = null)
            }, e && !n ? 0 : 300))
        },
        toggle: function (a) {
            b.isOpen && (b.current.fitToView = "boolean" === f.type(a) ? a : !b.current.fitToView, n && (b.wrap.removeAttr("style").addClass("fancybox-tmp"), b.trigger("onUpdate")), b.update())
        },
        hideLoading: function () {
            m.unbind(".loading");
            f("#fancybox-loading").remove()
        },
        showLoading: function () {
            var a, d;
            b.hideLoading();
            a = f('<div id="fancybox-loading"><div></div></div>').click(b.cancel).appendTo("body");
            m.bind("keydown.loading", function (a) {
                if (27 === (a.which || a.keyCode))a.preventDefault(), b.cancel()
            });
            b.defaults.fixed || (d = b.getViewport(), a.css({
                position: "absolute",
                top: 0.5 * d.h + d.y,
                left: 0.5 * d.w + d.x
            }))
        },
        getViewport: function () {
            var a = b.current && b.current.locked || !1, d = {x: r.scrollLeft(), y: r.scrollTop()};
            a ? (d.w = a[0].clientWidth, d.h = a[0].clientHeight) : (d.w = n && B.innerWidth ? B.innerWidth : r.width(), d.h = n && B.innerHeight ? B.innerHeight : r.height());
            return d
        },
        unbindEvents: function () {
            b.wrap && s(b.wrap) && b.wrap.unbind(".fb");
            m.unbind(".fb");
            r.unbind(".fb")
        },
        bindEvents: function () {
            var a = b.current, d;
            a && (r.bind("orientationchange.fb" + (n ? "" : " resize.fb") + (a.autoCenter && !a.locked ? " scroll.fb" : ""), b.update), (d = a.keys) && m.bind("keydown.fb", function (e) {
                var c = e.which || e.keyCode, j = e.target || e.srcElement;
                if (27 === c && b.coming)return !1;
                !e.ctrlKey && (!e.altKey && !e.shiftKey && !e.metaKey && (!j || !j.type && !f(j).is("[contenteditable]"))) && f.each(d, function (d, j) {
                    if (1 < a.group.length && j[c] !== q)return b[d](j[c]), e.preventDefault(), !1;
                    if (-1 < f.inArray(c, j))return b[d](), e.preventDefault(), !1
                })
            }), f.fn.mousewheel && a.mouseWheel && b.wrap.bind("mousewheel.fb", function (d, c, j, g) {
                for (var h = f(d.target || null), i = !1; h.length && !i && !h.is(".fancybox-skin") && !h.is(".fancybox-wrap");)i = h[0] && !(h[0].style.overflow && "hidden" === h[0].style.overflow) && (h[0].clientWidth && h[0].scrollWidth > h[0].clientWidth || h[0].clientHeight && h[0].scrollHeight > h[0].clientHeight), h = f(h).parent();
                if (0 !== c && !i && 1 < b.group.length && !a.canShrink) {
                    if (0 < g || 0 < j)b.prev(0 < g ? "down" : "left"); else if (0 > g || 0 > j)b.next(0 > g ? "up" : "right");
                    d.preventDefault()
                }
            }))
        },
        trigger: function (a, d) {
            var e, c = d || b.coming || b.current;
            if (c) {
                f.isFunction(c[a]) && (e = c[a].apply(c, Array.prototype.slice.call(arguments, 1)));
                if (!1 === e)return !1;
                c.helpers && f.each(c.helpers, function (d, e) {
                    e && (b.helpers[d] && f.isFunction(b.helpers[d][a])) && (e = f.extend(!0, {}, b.helpers[d].defaults, e), b.helpers[d][a](e, c))
                });
                f.event.trigger(a + ".fb")
            }
        },
        isImage: function (a) {
            return p(a) && a.match(/(^data:image\/.*,)|(\.(jp(e|g|eg)|gif|png|bmp|webp)((\?|#).*)?$)/i)
        },
        isSWF: function (a) {
            return p(a) && a.match(/\.(swf)((\?|#).*)?$/i)
        },
        _start: function (a) {
            var d = {}, e, c, a = k(a);
            e = b.group[a] || null;
            if (!e)return !1;
            d = f.extend(!0, {}, b.opts, e);
            e = d.margin;
            c = d.padding;
            "number" === f.type(e) && (d.margin = [e, e, e, e]);
            "number" === f.type(c) && (d.padding = [c, c, c, c]);
            d.modal && f.extend(!0, d, {
                closeBtn: !1,
                closeClick: !1,
                nextClick: !1,
                arrows: !1,
                mouseWheel: !1,
                keys: null,
                helpers: {overlay: {closeClick: !1}}
            });
            d.autoSize && (d.autoWidth = d.autoHeight = !0);
            "auto" === d.width && (d.autoWidth = !0);
            "auto" === d.height && (d.autoHeight = !0);
            d.group = b.group;
            d.index = a;
            b.coming = d;
            if (!1 === b.trigger("beforeLoad"))b.coming = null; else {
                c = d.type;
                e = d.href;
                if (!c)return b.coming = null, b.current && b.router && "jumpto" !== b.router ? (b.current.index = a, b[b.router](b.direction)) : !1;
                b.isActive = !0;
                if ("image" === c || "swf" === c)d.autoHeight = d.autoWidth = !1, d.scrolling = "visible";
                "image" === c && (d.aspectRatio = !0);
                "iframe" === c && n && (d.scrolling = "scroll");
                d.wrap = f(d.tpl.wrap).addClass("fancybox-" + (n ? "mobile" : "desktop") + " fancybox-type-" + c + " fancybox-tmp " + d.wrapCSS).appendTo(d.parent || "body");
                f.extend(d, {
                    skin: f(".fancybox-skin", d.wrap),
                    outer: f(".fancybox-outer", d.wrap),
                    inner: f(".fancybox-inner", d.wrap)
                });
                f.each(["Top", "Right", "Bottom", "Left"], function (a, b) {
                    d.skin.css("padding" + b, v(d.padding[a]))
                });
                b.trigger("onReady");
                if ("inline" === c || "html" === c) {
                    if (!d.content || !d.content.length)return b._error("content")
                } else if (!e)return b._error("href");
                "image" === c ? b._loadImage() : "ajax" === c ? b._loadAjax() : "iframe" === c ? b._loadIframe() : b._afterLoad()
            }
        },
        _error: function (a) {
            f.extend(b.coming, {
                type: "html",
                autoWidth: !0,
                autoHeight: !0,
                minWidth: 0,
                minHeight: 0,
                scrolling: "no",
                hasError: a,
                content: b.coming.tpl.error
            });
            b._afterLoad()
        },
        _loadImage: function () {
            var a = b.imgPreload = new Image;
            a.onload = function () {
                this.onload = this.onerror = null;
                b.coming.width = this.width;
                b.coming.height = this.height;
                b._afterLoad()
            };
            a.onerror = function () {
                this.onload = this.onerror = null;
                b._error("image")
            };
            a.src = b.coming.href;
            !0 !== a.complete && b.showLoading()
        },
        _loadAjax: function () {
            var a = b.coming;
            b.showLoading();
            b.ajaxLoad = f.ajax(f.extend({}, a.ajax, {
                url: a.href, error: function (a, e) {
                    b.coming && "abort" !== e ? b._error("ajax", a) : b.hideLoading()
                }, success: function (d, e) {
                    "success" === e && (a.content = d, b._afterLoad())
                }
            }))
        },
        _loadIframe: function () {
            var a = b.coming, d = f(a.tpl.iframe.replace(/\{rnd\}/g, (new Date).getTime())).attr("scrolling", n ? "auto" : a.iframe.scrolling).attr("src", a.href);
            f(a.wrap).bind("onReset", function () {
                try {
                    f(this).find("iframe").hide().attr("src", "//about:blank").end().empty()
                } catch (a) {
                }
            });
            a.iframe.preload && (b.showLoading(), d.one("load", function () {
                f(this).data("ready", 1);
                n || f(this).bind("load.fb", b.update);
                f(this).parents(".fancybox-wrap").width("100%").removeClass("fancybox-tmp").show();
                b._afterLoad()
            }));
            a.content = d.appendTo(a.inner);
            a.iframe.preload || b._afterLoad()
        },
        _preloadImages: function () {
            var a = b.group, d = b.current, e = a.length, c = d.preload ? Math.min(d.preload, e - 1) : 0, f, g;
            for (g = 1; g <= c; g += 1)f = a[(d.index + g) % e], "image" === f.type && f.href && ((new Image).src = f.href)
        },
        _afterLoad: function () {
            var a = b.coming, d = b.current, e, c, j, g, h;
            b.hideLoading();
            if (a && !1 !== b.isActive)if (!1 === b.trigger("afterLoad", a, d))a.wrap.stop(!0).trigger("onReset").remove(), b.coming = null; else {
                d && (b.trigger("beforeChange", d), d.wrap.stop(!0).removeClass("fancybox-opened").find(".fancybox-item, .fancybox-nav").remove());
                b.unbindEvents();
                e = a.content;
                c = a.type;
                j = a.scrolling;
                f.extend(b, {wrap: a.wrap, skin: a.skin, outer: a.outer, inner: a.inner, current: a, previous: d});
                g = a.href;
                switch (c) {
                    case "inline":
                    case "ajax":
                    case "html":
                        a.selector ? e = f("<div>").html(e).find(a.selector) : s(e) && (e.data("fancybox-placeholder") || e.data("fancybox-placeholder", f('<div class="fancybox-placeholder"></div>').insertAfter(e).hide()), e = e.show().detach(), a.wrap.bind("onReset", function () {
                                f(this).find(e).length && e.hide().replaceAll(e.data("fancybox-placeholder")).data("fancybox-placeholder", !1)
                            }));
                        break;
                    case "image":
                        e = a.tpl.image.replace("{href}", g);
                        break;
                    case "swf":
                        e = '<object id="fancybox-swf" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%"><param name="movie" value="' + g + '"></param>', h = "", f.each(a.swf, function (a, b) {
                            e += '<param name="' + a + '" value="' + b + '"></param>';
                            h += " " + a + '="' + b + '"'
                        }), e += '<embed src="' + g + '" type="application/x-shockwave-flash" width="100%" height="100%"' + h + "></embed></object>"
                }
                (!s(e) || !e.parent().is(a.inner)) && a.inner.append(e);
                b.trigger("beforeShow");
                a.inner.css("overflow", "yes" === j ? "scroll" : "no" === j ? "hidden" : j);
                b._setDimension();
                b.reposition();
                b.isOpen = !1;
                b.coming = null;
                b.bindEvents();
                if (b.isOpened) {
                    if (d.prevMethod)b.transitions[d.prevMethod]()
                } else f(".fancybox-wrap").not(a.wrap).stop(!0).trigger("onReset").remove();
                b.transitions[b.isOpened ? a.nextMethod : a.openMethod]();
                b._preloadImages()
            }
        },
        _setDimension: function () {
            var a = b.getViewport(), d = 0, e = !1, c = !1, e = b.wrap, j = b.skin, g = b.inner, h = b.current, c = h.width, i = h.height, l = h.minWidth, t = h.minHeight, m = h.maxWidth, n = h.maxHeight, r = h.scrolling, p = h.scrollOutside ? h.scrollbarWidth : 0, w = h.margin, y = k(w[1] + w[3]), q = k(w[0] + w[2]), x, z, s, C, A, F, B, D, u;
            e.add(j).add(g).width("auto").height("auto").removeClass("fancybox-tmp");
            w = k(j.outerWidth(!0) - j.width());
            x = k(j.outerHeight(!0) - j.height());
            z = y + w;
            s = q + x;
            C = E(c) ? (a.w - z) * k(c) / 100 : c;
            A = E(i) ? (a.h - s) * k(i) / 100 : i;
            if ("iframe" === h.type) {
                if (u = h.content, h.autoHeight && 1 === u.data("ready"))try {
                    u[0].contentWindow.document.location && (g.width(C).height(9999), F = u.contents().find("body"), p && F.css("overflow-x", "hidden"), A = F.height())
                } catch (G) {
                }
            } else if (h.autoWidth || h.autoHeight)g.addClass("fancybox-tmp"), h.autoWidth || g.width(C), h.autoHeight || g.height(A), h.autoWidth && (C = g.width()), h.autoHeight && (A = g.height()), g.removeClass("fancybox-tmp");
            c = k(C);
            i = k(A);
            D = C / A;
            l = k(E(l) ? k(l, "w") - z : l);
            m = k(E(m) ? k(m, "w") - z : m);
            t = k(E(t) ? k(t, "h") - s : t);
            n = k(E(n) ? k(n, "h") - s : n);
            F = m;
            B = n;
            h.fitToView && (m = Math.min(a.w - z, m), n = Math.min(a.h - s, n));
            z = a.w - y;
            q = a.h - q;
            h.aspectRatio ? (c > m && (c = m, i = k(c / D)), i > n && (i = n, c = k(i * D)), c < l && (c = l, i = k(c / D)), i < t && (i = t, c = k(i * D))) : (c = Math.max(l, Math.min(c, m)), h.autoHeight && "iframe" !== h.type && (g.width(c), i = g.height()), i = Math.max(t, Math.min(i, n)));
            if (h.fitToView)if (g.width(c).height(i), e.width(c + w), a = e.width(), y = e.height(), h.aspectRatio)for (; (a > z || y > q) && (c > l && i > t) && !(19 < d++);)i = Math.max(t, Math.min(n, i - 10)), c = k(i * D), c < l && (c = l, i = k(c / D)), c > m && (c = m, i = k(c / D)), g.width(c).height(i), e.width(c + w), a = e.width(), y = e.height(); else c = Math.max(l, Math.min(c, c - (a - z))), i = Math.max(t, Math.min(i, i - (y - q)));
            p && ("auto" === r && i < A && c + w + p < z) && (c += p);
            g.width(c).height(i);
            e.width(c + w);
            a = e.width();
            y = e.height();
            e = (a > z || y > q) && c > l && i > t;
            c = h.aspectRatio ? c < F && i < B && c < C && i < A : (c < F || i < B) && (c < C || i < A);
            f.extend(h, {
                dim: {width: v(a), height: v(y)},
                origWidth: C,
                origHeight: A,
                canShrink: e,
                canExpand: c,
                wPadding: w,
                hPadding: x,
                wrapSpace: y - j.outerHeight(!0),
                skinSpace: j.height() - i
            });
            !u && (h.autoHeight && i > t && i < n && !c) && g.height("auto")
        },
        _getPosition: function (a) {
            var d = b.current, e = b.getViewport(), c = d.margin, f = b.wrap.width() + c[1] + c[3], g = b.wrap.height() + c[0] + c[2], c = {
                position: "absolute",
                top: c[0],
                left: c[3]
            };
            d.autoCenter && d.fixed && !a && g <= e.h && f <= e.w ? c.position = "fixed" : d.locked || (c.top += e.y, c.left += e.x);
            c.top = v(Math.max(c.top, c.top + (e.h - g) * d.topRatio));
            c.left = v(Math.max(c.left, c.left + (e.w - f) * d.leftRatio));
            return c
        },
        _afterZoomIn: function () {
            var a = b.current;
            a && (b.isOpen = b.isOpened = !0, b.wrap.css("overflow", "visible").addClass("fancybox-opened"), b.update(), (a.closeClick || a.nextClick && 1 < b.group.length) && b.inner.css("cursor", "pointer").bind("click.fb", function (d) {
                !f(d.target).is("a") && !f(d.target).parent().is("a") && (d.preventDefault(), b[a.closeClick ? "close" : "next"]())
            }), a.closeBtn && f(a.tpl.closeBtn).appendTo(b.skin).bind(n ? "touchstart.fb" : "click.fb", function (a) {
                a.preventDefault();
                b.close()
            }), a.arrows && 1 < b.group.length && ((a.loop || 0 < a.index) && f(a.tpl.prev).appendTo(b.outer).bind("click.fb", b.prev), (a.loop || a.index < b.group.length - 1) && f(a.tpl.next).appendTo(b.outer).bind("click.fb", b.next)), b.trigger("afterShow"), !a.loop && a.index === a.group.length - 1 ? b.play(!1) : b.opts.autoPlay && !b.player.isActive && (b.opts.autoPlay = !1, b.play()))
        },
        _afterZoomOut: function (a) {
            a = a || b.current;
            f(".fancybox-wrap").trigger("onReset").remove();
            f.extend(b, {
                group: {},
                opts: {},
                router: !1,
                current: null,
                isActive: !1,
                isOpened: !1,
                isOpen: !1,
                isClosing: !1,
                wrap: null,
                skin: null,
                outer: null,
                inner: null
            });
            b.trigger("afterClose", a)
        }
    });
    b.transitions = {
        getOrigPosition: function () {
            var a = b.current, d = a.element, e = a.orig, c = {}, f = 50, g = 50, h = a.hPadding, i = a.wPadding, l = b.getViewport();
            !e && (a.isDom && d.is(":visible")) && (e = d.find("img:first"), e.length || (e = d));
            s(e) ? (c = e.offset(), e.is("img") && (f = e.outerWidth(), g = e.outerHeight())) : (c.top = l.y + (l.h - g) * a.topRatio, c.left = l.x + (l.w - f) * a.leftRatio);
            if ("fixed" === b.wrap.css("position") || a.locked)c.top -= l.y, c.left -= l.x;
            return c = {
                top: v(c.top - h * a.topRatio),
                left: v(c.left - i * a.leftRatio),
                width: v(f + i),
                height: v(g + h)
            }
        }, step: function (a, d) {
            var e, c, f = d.prop;
            c = b.current;
            var g = c.wrapSpace, h = c.skinSpace;
            if ("width" === f || "height" === f)e = d.end === d.start ? 1 : (a - d.start) / (d.end - d.start), b.isClosing && (e = 1 - e), c = "width" === f ? c.wPadding : c.hPadding, c = a - c, b.skin[f](k("width" === f ? c : c - g * e)), b.inner[f](k("width" === f ? c : c - g * e - h * e))
        }, zoomIn: function () {
            var a = b.current, d = a.pos, e = a.openEffect, c = "elastic" === e, j = f.extend({opacity: 1}, d);
            delete j.position;
            c ? (d = this.getOrigPosition(), a.openOpacity && (d.opacity = 0.1)) : "fade" === e && (d.opacity = 0.1);
            b.wrap.css(d).animate(j, {
                duration: "none" === e ? 0 : a.openSpeed,
                easing: a.openEasing,
                step: c ? this.step : null,
                complete: b._afterZoomIn
            })
        }, zoomOut: function () {
            var a = b.current, d = a.closeEffect, e = "elastic" === d, c = {opacity: 0.1};
            e && (c = this.getOrigPosition(), a.closeOpacity && (c.opacity = 0.1));
            b.wrap.animate(c, {
                duration: "none" === d ? 0 : a.closeSpeed,
                easing: a.closeEasing,
                step: e ? this.step : null,
                complete: b._afterZoomOut
            })
        }, changeIn: function () {
            var a = b.current, d = a.nextEffect, e = a.pos, c = {opacity: 1}, f = b.direction, g;
            e.opacity = 0.1;
            "elastic" === d && (g = "down" === f || "up" === f ? "top" : "left", "down" === f || "right" === f ? (e[g] = v(k(e[g]) - 200), c[g] = "+=200px") : (e[g] = v(k(e[g]) + 200), c[g] = "-=200px"));
            "none" === d ? b._afterZoomIn() : b.wrap.css(e).animate(c, {
                    duration: a.nextSpeed,
                    easing: a.nextEasing,
                    complete: function () {
                        setTimeout(b._afterZoomIn, 20)
                    }
                })
        }, changeOut: function () {
            var a = b.previous, d = a.prevEffect, e = {opacity: 0.1}, c = b.direction;
            "elastic" === d && (e["down" === c || "up" === c ? "top" : "left"] = ("up" === c || "left" === c ? "-" : "+") + "=200px");
            a.wrap.animate(e, {
                duration: "none" === d ? 0 : a.prevSpeed, easing: a.prevEasing, complete: function () {
                    f(this).trigger("onReset").remove()
                }
            })
        }
    };
    b.helpers.overlay = {
        defaults: {closeClick: !0, speedOut: 200, showEarly: !0, css: {}, locked: !n, fixed: !0},
        overlay: null,
        fixed: !1,
        create: function (a) {
            a = f.extend({}, this.defaults, a);
            this.overlay && this.close();
            this.overlay = f('<div class="fancybox-overlay"></div>').appendTo("body");
            this.fixed = !1;
            a.fixed && b.defaults.fixed && (this.overlay.addClass("fancybox-overlay-fixed"), this.fixed = !0)
        },
        open: function (a) {
            var d = this, a = f.extend({}, this.defaults, a);
            this.overlay ? this.overlay.unbind(".overlay").width("auto").height("auto") : this.create(a);
            this.fixed || (r.bind("resize.overlay", f.proxy(this.update, this)), this.update());
            a.closeClick && this.overlay.bind("click.overlay", function (a) {
                f(a.target).hasClass("fancybox-overlay") && (b.isActive ? b.close() : d.close())
            });
            this.overlay.css(a.css).show()
        },
        close: function () {
            f(".fancybox-overlay").remove();
            r.unbind("resize.overlay");
            this.overlay = null;
            !1 !== this.margin && (f("body").css("margin-right", this.margin), this.margin = !1);
            this.el && this.el.removeClass("fancybox-lock")
        },
        update: function () {
            var a = "100%", b;
            this.overlay.width(a).height("100%");
            f.browser.msie ? (b = Math.max(x.documentElement.offsetWidth, x.body.offsetWidth), m.width() > b && (a = m.width())) : m.width() > r.width() && (a = m.width());
            this.overlay.width(a).height(m.height())
        },
        onReady: function (a, b) {
            f(".fancybox-overlay").stop(!0, !0);
            this.overlay || (this.margin = m.height() > r.height() || "scroll" === f("body").css("overflow-y") ? f("body").css("margin-right") : !1, this.el = x.all && !x.querySelector ? f("html") : f("body"), this.create(a));
            a.locked && this.fixed && (b.locked = this.overlay.append(b.wrap), b.fixed = !1);
            !0 === a.showEarly && this.beforeShow.apply(this, arguments)
        },
        beforeShow: function (a, b) {
            b.locked && (this.el.addClass("fancybox-lock"), !1 !== this.margin && f("body").css("margin-right", k(this.margin) + b.scrollbarWidth));
            this.open(a)
        },
        onUpdate: function () {
            this.fixed || this.update()
        },
        afterClose: function (a) {
            this.overlay && !b.isActive && this.overlay.fadeOut(a.speedOut, f.proxy(this.close, this))
        }
    };
    b.helpers.title = {
        defaults: {type: "float", position: "bottom"}, beforeShow: function (a) {
            var d = b.current, e = d.title, c = a.type;
            f.isFunction(e) && (e = e.call(d.element, d));
            if (p(e) && "" !== f.trim(e)) {
                d = f('<div class="fancybox-title fancybox-title-' + c + '-wrap">' + e + "</div>");
                switch (c) {
                    case "inside":
                        c = b.skin;
                        break;
                    case "outside":
                        c = b.wrap;
                        break;
                    case "over":
                        c = b.inner;
                        break;
                    default:
                        c = b.skin, d.appendTo("body"), f.browser.msie && d.width(d.width()), d.wrapInner('<span class="child"></span>'), b.current.margin[2] += Math.abs(k(d.css("margin-bottom")))
                }
                d["top" === a.position ? "prependTo" : "appendTo"](c)
            }
        }
    };
    f.fn.fancybox = function (a) {
        var d, e = f(this), c = this.selector || "", j = function (g) {
            var h = f(this).blur(), i = d, j, k;
            !g.ctrlKey && (!g.altKey && !g.shiftKey && !g.metaKey) && !h.is(".fancybox-wrap") && (j = a.groupAttr || "data-fancybox-group", k = h.attr(j), k || (j = "rel", k = h.get(0)[j]), k && ("" !== k && "nofollow" !== k) && (h = c.length ? f(c) : e, h = h.filter("[" + j + '="' + k + '"]'), i = h.index(this)), a.index = i, !1 !== b.open(h, a) && g.preventDefault())
        }, a = a || {};
        d = a.index || 0;
        !c || !1 === a.live ? e.unbind("click.fb-start").bind("click.fb-start", j) : m.undelegate(c, "click.fb-start").delegate(c + ":not('.fancybox-item, .fancybox-nav')", "click.fb-start", j);
        this.filter("[data-fancybox-start=1]").trigger("click");
        return this
    };
    m.ready(function () {
        f.scrollbarWidth === q && (f.scrollbarWidth = function () {
            var a = f('<div style="width:50px;height:50px;overflow:auto"><div/></div>').appendTo("body"), b = a.children(), b = b.innerWidth() - b.height(99).innerWidth();
            a.remove();
            return b
        });
        if (f.support.fixedPosition === q) {
            var a = f.support, d = f('<div style="position:fixed;top:20px;"></div>').appendTo("body"), e = 20 === d[0].offsetTop || 15 === d[0].offsetTop;
            d.remove();
            a.fixedPosition = e
        }
        f.extend(b.defaults, {scrollbarWidth: f.scrollbarWidth(), fixed: f.support.fixedPosition, parent: f("body")})
    })
})(window, document, jQuery);
