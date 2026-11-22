# UNICC AI safety testing

I worked on the test workflow and reporting interface for this 2025 project. An evaluator picks the checks to run, reviews the results from each test and uses the report to decide what needs a fix or another run.

![Test configuration screen from the December 2025 project presentation](../assets/safety-input.png)

One detail mattered for interpreting results. If the environment check fails, the prototype stops and explains why. A reviewer can tell whether a model failed a test or the test never ran. For completed runs, the report keeps the logs alongside the findings.

I designed the reporting workflow around the decision after a run. Low-risk findings go into routine monitoring. A medium-risk finding calls for a change and another test before release. A high-risk finding blocks release pending remediation. The proposed PDF and HTML reports carry the test logs and risk descriptions so the person making that call can inspect the evidence.

[Project repository](https://github.com/Chen1212123/UNICC-AI-Safety-Testing-Framework) · [Evaluation flow](../assets/portfolio-safety-system.svg) · [Full case](https://shixuanlin.com/projects/ai-safety-testing-framework)
