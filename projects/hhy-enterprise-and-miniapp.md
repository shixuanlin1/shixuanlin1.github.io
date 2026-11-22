# Honghuayuan Fabric

A buyer accepts only part of a fabric quote. Does the original price still apply? What if the mill has already prepared the material? I used cases like these to design the rules behind Honghuayuan's management system and WeChat Mini Program.

## From quote to payment

In my order model, each order keeps the version of the quote the buyer accepted. Sales can refer back to its quantities and terms when an order changes. Production records what the mill can make, the warehouse records what actually ships, and finance records what the buyer pays. Each team can answer its own question about the same order. Approving a price, for example, tells sales nothing about whether the mill can meet a delivery date.

![How sales, production, finance and management share order and product records](../assets/portfolio-enterprise-capabilities.svg)

## Letting overseas buyers browse

I removed an early registration step so overseas buyers could browse without a Chinese phone number. That left staff to confirm which company an inquiry belonged to. Counting clicks on the buyer's screen would have missed that extra work.

[Mini Program screenshots](https://github.com/shixuanlin1/miniprogramforcompanydemo) · [Full case and operating framework](https://shixuanlin.com/projects/b2b-digital-operations-platform)
