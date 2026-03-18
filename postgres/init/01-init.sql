CREATE USER auth_service WITH
    PASSWORD'{{AUTH_SERVICE_DB_PASSWORD}}'
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE
    LOGIN;

CREATE DATABASE auth_db
    OWNER auth_service
    ENCODING 'UTF8'
    LC_COLLATE 'en_US.utf8'
    LC_CTYPE   'en_US.utf8'
    TEMPLATE  template0;


REVOKE ALL ON DATABASE auth_db FROM PUBLIC;
GRANT CONNECT ON DATABASE auth_db TO auth_service;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO auth_service;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO auth_service;

\connect auth_db

ALTER SCHEMA public OWNER TO auth_service;
GRANT ALL ON SCHEMA public TO auth_service;

GRANT CREATE ON SCHEMA public TO auth_service;

\connect postgres


CREATE USER parser_service WITH
    PASSWORD'{{PARSER_SERVICE_DB_PASSWORD}}'
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE
    LOGIN;

CREATE DATABASE parser_db
    OWNER parser_service
    ENCODING 'UTF8'
    LC_COLLATE 'en_US.utf8'
    LC_CTYPE   'en_US.utf8'
    TEMPLATE  template0;

REVOKE ALL ON DATABASE parser_db FROM PUBLIC;
GRANT CONNECT ON DATABASE parser_db TO parser_service;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO parser_service;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO parser_service;

GRANT CREATE ON SCHEMA public TO parser_service;

\connect postgres

