# Reviewing harmful narratives in news

For this 2024 UNICC-sponsored project at NYU, I built the document processing and connected the modules that detect harmful language, check facts and terminology, and identify the article's topic. Reviewers could work through a chatbot or upload a document in Streamlit.

The topic module originally returned free text, while the other modules expected structured records. I worked on a shared JSON format so the reviewer could read the topic alongside the language and terminology findings for the same article.

In the public Streamlit app, I also set a minimum for what appears on screen. A rating without a reason is discarded. A rating with a reason still appears if keywords are missing. Those two decisions are visible in [the response parser](https://github.com/shixuanlin1/unicc/blob/main/demo.py#L32-L47).

![Narrative Guardian chatbot from the original NYU project report](../assets/media-chatbot.png)

[Two sample responses, no API key](https://github.com/shixuanlin1/unicc#two-sample-responses) · [Streamlit code and setup](https://github.com/shixuanlin1/unicc) · [Co-authored IEEE paper](https://doi.org/10.1109/ISEC64801.2025.11147198) · [Full project](https://shixuanlin.com/projects/multilingual-content-safety-analysis)
