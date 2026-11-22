-- Run once against an empty SQLite database. All records and prices are fictional.
PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

CREATE TABLE quote_revision (
    quote_id TEXT NOT NULL,
    revision INTEGER NOT NULL CHECK (revision > 0),
    pricing_basis TEXT NOT NULL,
    PRIMARY KEY (quote_id, revision)
);
CREATE TABLE quote_line (
    quote_id TEXT NOT NULL,
    revision INTEGER NOT NULL,
    colour TEXT NOT NULL,
    metres INTEGER NOT NULL CHECK (metres > 0),
    unit_cents INTEGER NOT NULL CHECK (unit_cents > 0),
    PRIMARY KEY (quote_id, revision, colour),
    FOREIGN KEY (quote_id, revision) REFERENCES quote_revision
);
CREATE TABLE sales_order (
    order_id TEXT PRIMARY KEY NOT NULL,
    quote_id TEXT NOT NULL,
    revision INTEGER NOT NULL,
    accepted_on TEXT NOT NULL,
    UNIQUE (order_id, quote_id, revision),
    FOREIGN KEY (quote_id, revision) REFERENCES quote_revision
);
CREATE TABLE dispatch (
    dispatch_id TEXT PRIMARY KEY NOT NULL,
    order_id TEXT NOT NULL,
    quote_id TEXT NOT NULL,
    revision INTEGER NOT NULL,
    colour TEXT NOT NULL,
    dye_lot TEXT NOT NULL,
    metres INTEGER NOT NULL CHECK (metres > 0),
    FOREIGN KEY (order_id, quote_id, revision) REFERENCES sales_order (order_id, quote_id, revision),
    FOREIGN KEY (quote_id, revision, colour) REFERENCES quote_line
);
CREATE TABLE invoice (
    invoice_id TEXT PRIMARY KEY NOT NULL,
    dispatch_id TEXT NOT NULL UNIQUE REFERENCES dispatch,
    amount_cents INTEGER NOT NULL CHECK (amount_cents > 0)
);
CREATE TABLE receipt (
    receipt_id TEXT PRIMARY KEY NOT NULL,
    amount_cents INTEGER NOT NULL CHECK (amount_cents > 0)
);
CREATE TABLE allocation (
    receipt_id TEXT NOT NULL REFERENCES receipt,
    invoice_id TEXT NOT NULL REFERENCES invoice,
    amount_cents INTEGER NOT NULL CHECK (amount_cents > 0),
    PRIMARY KEY (receipt_id, invoice_id)
);

INSERT INTO quote_revision VALUES
    ('Q-17', 1, 'Combined quantity across two colours'),
    ('Q-17', 2, 'Repriced for one colour');
INSERT INTO quote_line VALUES
    ('Q-17', 1, 'Navy', 600, 800),
    ('Q-17', 1, 'Sand', 400, 800),
    ('Q-17', 2, 'Navy', 600, 900);
INSERT INTO sales_order VALUES ('SO-42', 'Q-17', 2, '2026-01-12');
INSERT INTO dispatch VALUES
    ('S-1', 'SO-42', 'Q-17', 2, 'Navy', 'DEMO-LOT-A', 320),
    ('S-2', 'SO-42', 'Q-17', 2, 'Navy', 'DEMO-LOT-B', 80);
INSERT INTO invoice VALUES ('AR-1', 'S-1', 288000), ('AR-2', 'S-2', 72000);
INSERT INTO receipt VALUES ('RC-7', 300000);
INSERT INTO allocation VALUES ('RC-7', 'AR-1', 288000), ('RC-7', 'AR-2', 12000);
COMMIT;
