@servers(['web' => 'root@162.243.76.10', 'local' => 'ryanthompson@127.0.0.1'])

@task('push', ['on' => 'web'])
cd /usr/share/nginx/html/grishamind/
git pull
@endtask

@task('update', ['on' => 'web'])
cd /usr/share/nginx/html/grishamind/
composer update -o
@endtask

@task('clean', ['on' => 'web'])
cd /usr/share/nginx/html/grishamind/
php artisan asset:clear public
php artisan cache:clear
php artisan twig:clean
chmod -R 777 storage/ public/app/ bootstrap/cache/
@endtask
