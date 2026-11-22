# UNICC AI safety testing

I worked on the test workflow and reporting interface for this 2025 project. An evaluator picks the checks to run, reviews the results from each test and uses the report to decide what needs a fix or another run.

![Test configuration screen from the December 2025 project presentation](../assets/safety-input.png)

One detail mattered for interpreting results. If the environment check fails, the prototype stops and explains why. A reviewer can tell whether a model failed a test or the test never ran. For completed runs, the report keeps the logs alongside the findings.

[Project repository](https://github.com/Chen1212123/UNICC-AI-Safety-Testing-Framework) · [Evaluation flow](../assets/portfolio-safety-system.svg) · [Full case](https://shixuanlin.com/projects/ai-safety-testing-framework)
