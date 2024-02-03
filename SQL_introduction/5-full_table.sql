-- 5-table_description.sql

-- Set the database context
USE ?;

-- Retrieve table details from information schema
SELECT CONCAT(
    'CREATE TABLE `', TABLE_NAME, '` (\n',
    GROUP_CONCAT(
        '  `', COLUMN_NAME, '` ', COLUMN_TYPE,
        IF(IS_NULLABLE = 'NO', ' NOT NULL', ''),
        IF(COLUMN_DEFAULT IS NOT NULL, CONCAT(' DEFAULT ', QUOTE(COLUMN_DEFAULT)), ''),
        '\n'
        ORDER BY ORDINAL_POSITION SEPARATOR ''
    ),
    IFNULL(
        CONCAT('  PRIMARY KEY (', GROUP_CONCAT('`', COLUMN_NAME, '`'), ')\n'),
        ''
    ),
    ') ENGINE=', ENGINE, ' DEFAULT CHARSET=', CHARACTER_SET_NAME, ' COLLATE=', COLLATION_NAME
) AS CreateTableStatement
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = ? AND TABLE_NAME = 'first_table'
GROUP BY TABLE_NAME;
