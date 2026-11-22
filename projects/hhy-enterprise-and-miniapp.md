# Honghuayuan Fabric

A buyer accepts only part of a fabric quote. Does the original price still apply? What if the mill has already prepared the material? I used cases like these to design the rules behind Honghuayuan's management system and WeChat Mini Program.

## What happens to the quote?

Suppose a buyer accepts one colour from a quote priced for several. Sales needs the original quantities and discount to know whether that price still holds. The mill has a different question. Can it make the smaller run for that colour? I modelled these as separate decisions so that a price approval could never double as a production sign-off.

| When the order changes | What I designed the system to keep |
| --- | --- |
| The buyer changes the quantity after preparation starts | The accepted quote, the revised quantity and any material or work already committed. The commercial owner can see the cost of agreeing to the change. |
| The warehouse ships part of an order | The order line, dye lot, rolls shipped and quantity still due. Sales can tell the buyer exactly what remains. |
| A payment arrives | The receipt and the amount applied to each outstanding balance. Finance can trace how a balance was settled. |

![How sales, production, finance and management share order and product records](../assets/portfolio-enterprise-capabilities.svg)

## Letting overseas buyers browse

I removed an early registration step so overseas buyers could browse without a Chinese phone number. That left staff to confirm which company an inquiry belonged to. Counting clicks on the buyer's screen would have missed that extra work.

[Mini Program screenshots](https://github.com/shixuanlin1/miniprogramforcompanydemo) · [Full case and operating framework](https://shixuanlin.com/projects/b2b-digital-operations-platform)
