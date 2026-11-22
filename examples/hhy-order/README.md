# One fabric order, three questions

A buyer asks for navy and sand fabric, then accepts only the navy. Sales revises the quote, the warehouse makes two dispatches, and finance applies one bank receipt to two invoices. I made this small SQLite example to show how I model those decisions at Honghuayuan. All records, quantities and USD prices here are fictional.

| Question | What the records show |
| --- | --- |
| Which quote did the buyer accept? | Order **SO-42** points to **Q-17, revision 2**, for 600 m of navy at $9/m. Revision 1 still shows both colours at $8/m. |
| How much is left to ship? | The warehouse dispatched 320 m and 80 m from two dye lots. **200 m** of the accepted order remains open. |
| Where did the $3,000 receipt go? | **$2,880** settled invoice AR-1. **$120** went to AR-2, leaving **$600** due on that invoice. The remaining 200 m on the order is a separate delivery obligation. |

## Run the queries

Download [order.sqlite3](https://raw.githubusercontent.com/shixuanlin1/shixuanlin1.github.io/master/examples/hhy-order/order.sqlite3) and [queries.sql](https://raw.githubusercontent.com/shixuanlin1/shixuanlin1.github.io/master/examples/hhy-order/queries.sql) to the same folder. From that folder, run the queries with SQLite.

```sh
sqlite3 -readonly -header -column order.sqlite3 < queries.sql
```

To recreate the database, run `sqlite3 rebuilt.sqlite3 < build.sql` in a folder with [build.sql](build.sql) and a new output filename. Prices and payments are stored in integer cents, quantities in metres. The dispatch references both the order and a colour in its accepted quote revision.

[Enterprise case study](../../projects/hhy-enterprise-and-miniapp.md)
