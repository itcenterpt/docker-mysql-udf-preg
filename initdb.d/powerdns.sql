CREATE OR REPLACE USER powerdns IDENTIFIED BY 'powerdns';
GRANT ALL PRIVILEGES ON powerdns.* TO powerdns;
FLUSH PRIVILEGES;
