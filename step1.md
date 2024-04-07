# Internet TV Database Schema

## Tables and Descriptions

### `channels`
| Field | Type         | Null | Key | Default | Extra          |
|-------|--------------|------|-----|---------|----------------|
| id    | bigint       | NO   | PRI | NULL    | auto_increment |
| name  | varchar(100) | NO   |     | NULL    |                |

### `episodes`
| Field                | Type         | Null | Key | Default | Extra          |
|----------------------|--------------|------|-----|---------|----------------|
| id                   | bigint       | NO   | PRI | NULL    | auto_increment |
| season_id            | bigint       | YES  | MUL | NULL    |                |
| episode_number       | int          | YES  |     | NULL    |                |
| title                | varchar(100) | NO   |     | NULL    |                |
| detail               | text         | YES  |     | NULL    |                |
| duration             | int          | YES  |     | 30      |                |
| release_date         | date         | NO   |     | NULL    |                |
| view_count           | bigint       | NO   |     | 0       |                |
| broadcast_start_time | datetime     | YES  |     | NULL    |                |
| broadcast_end_time   | datetime     | YES  |     | NULL    |                |

### `genres`
| Field | Type         | Null | Key | Default | Extra          |
|-------|--------------|------|-----|---------|----------------|
| id    | bigint       | NO   | PRI | NULL    | auto_increment |
| name  | varchar(100) | NO   |     | NULL    |                |

### `program_genres`
| Field      | Type   | Null | Key | Default | Extra |
|------------|--------|------|-----|---------|-------|
| program_id | bigint | NO   | PRI | NULL    |       |
| genre_id   | bigint | NO   | PRI | NULL    |       |

### `programs`
| Field      | Type         | Null | Key | Default | Extra          |
|------------|--------------|------|-----|---------|----------------|
| id         | bigint       | NO   | PRI | NULL    | auto_increment |
| title      | varchar(100) | NO   |     | NULL    |                |
| detail     | text         | YES  |     | NULL    |                |
| genre_id   | bigint       | YES  | MUL | NULL    |                |
| channel_id | bigint       | YES  | MUL | NULL    |                |

### `seasons`
| Field         | Type   | Null | Key | Default | Extra          |
|---------------|--------|------|-----|---------|----------------|
| id            | bigint | NO   | PRI | NULL    | auto_increment |
| program_id    | bigint | NO   | MUL | NULL    |                |
| season_number | int    | NO   |     | NULL    |                |

### `viewers`
| Field        | Type        | Null | Key | Default | Extra          |
|--------------|-------------|------|-----|---------|----------------|
| id           | bigint      | NO   | PRI | NULL    | auto_increment |
| content_id   | bigint      | NO   |     | NULL    |                |
| content_type | varchar(50) | NO   |     | NULL    |                |
| view_count   | int         | NO   |     | NULL    |                |
| view_date    | date        | NO   |     | NULL    |                |
| platform     | varchar(50) | YES  |     | NULL    |                |
