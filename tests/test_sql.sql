
-- SQL Advanced Syntax Test for Solarized Flat Theme
-- Table, constraints, types
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email TEXT UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(10) CHECK (status IN ('active', 'inactive'))
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- View
CREATE VIEW active_users AS
SELECT id, name FROM users WHERE status = 'active';

-- Function
CREATE OR REPLACE FUNCTION user_post_count(uid INTEGER) RETURNS INTEGER AS $$
    SELECT COUNT(*) FROM posts WHERE user_id = uid;
$$ LANGUAGE SQL;

-- Trigger
CREATE OR REPLACE FUNCTION update_timestamp() RETURNS TRIGGER AS $$
BEGIN
    NEW.created_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update BEFORE UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION update_timestamp();

-- CTE, window function, subquery
WITH ranked AS (
    SELECT u.id, u.name, COUNT(p.id) AS post_count,
           RANK() OVER (ORDER BY COUNT(p.id) DESC) AS rnk
    FROM users u
    LEFT JOIN posts p ON u.id = p.user_id
    GROUP BY u.id, u.name
)
SELECT * FROM ranked WHERE rnk <= 3;

-- Insert, update, delete
INSERT INTO users (name, email, status) VALUES ('Bob', 'bob@example.com', 'active');
UPDATE users SET status = 'inactive' WHERE id = 1;
DELETE FROM posts WHERE id = 10;
