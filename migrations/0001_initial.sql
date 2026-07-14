CREATE TABLE IF NOT EXISTS users (
  username TEXT PRIMARY KEY,
  pass_hash TEXT NOT NULL,
  custom_slugs TEXT,
  banned_until INTEGER
);

CREATE TABLE IF NOT EXISTS analytics (
  slug TEXT NOT NULL,
  referrer TEXT NOT NULL,
  count INTEGER DEFAULT 1,
  PRIMARY KEY (slug, referrer)
);
