BEGIN;

CREATE TYPE account_class AS ENUM (
	'liability',
	'assets',
	'income',
	'expense',
	'equity'
);

CREATE TYPE operation_type AS ENUM (
	'debit',
	'credit'
);

CREATE TABLE entries (
	id               UUID primary key,
	account_class    ACCOUNT_CLASS not null,
	account_group    TEXT not null,
	account_subgroup TEXT not null,
	account_id       TEXT not null,
	operation        OPERATION_TYPE not null,
	amount           INT not null,
	version          BIGINT not null,
	transaction_id   UUID not null,
	created_at       TIMESTAMPTZ not null default CURRENT_TIMESTAMP
);

CREATE INDEX idx_entries_account_class ON entries(account_class);
CREATE INDEX idx_entries_account_group ON entries(account_group);
CREATE INDEX idx_entries_account_subgroup ON entries(account_subgroup);
CREATE INDEX idx_entries_account_id ON entries(account_id);

COMMIT;
