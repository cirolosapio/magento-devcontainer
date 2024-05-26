composer create-project --repository=https://repo.magento.com/ magento/project-community-edition=2.4.7 tmp
mv tmp/** ./
mv tmp/.php-cs-fixer.dist.php ./

bin/magento setup:install \
--backend-frontname=admin \
--base-url=https://magento246.localhost/ \
--db-host=mariadb \
--db-name=magento \
--db-user=root \
--db-password=magento \
--admin-firstname=admin \
--admin-lastname=admin \
--admin-email=admin@admin.com \
--admin-user=magento \
--admin-password=password1 \
--timezone=Europe/Rome \
--use-rewrites=1 \
--cleanup-database \
--search-engine=opensearch \
--opensearch-host=opensearch

bin/magento deploy:mode:set developer