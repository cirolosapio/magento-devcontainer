composer create-project --repository=https://repo.magento.com/ magento/project-community-edition=2.4.6 tmp
mv tmp/** ./

m setup:install \
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
--opensearch-host=opensearch \
--opensearch-port=9200

m deploy:mode:set developer