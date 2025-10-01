# 📝 Conventional Commits Guide (Data Science Projects)

We use the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) style:

```
<type>(scope?): <short summary>
```
- **type** → what kind of change
- **scope** (optional) → the area (e.g., `docker`, `eda`, `model`, `data`)
- **summary** → clear, imperative tense (“add”, not “added”)

---

## Core Types
- **feat** → new feature or analysis
- **fix** → bug fix, correction in analysis
- **docs** → documentation, README, notes
- **chore** → maintenance (gitignore, config, renames)
- **build** → build system (Dockerfile, requirements)
- **refactor** → restructuring code/analysis without changing results
- **test** → tests, validation scripts, mock data
- **data** → dataset updates, preprocessing steps
- **exp** → experimental analysis, exploratory notebook work

---

## Examples (Generic)
- `feat(eda): add histogram plots for number frequency`
- `fix(data): correct mislabeled column headers in dataset`
- `docs(readme): add instructions for running Jupyter in Docker`
- `build(docker): add numpy and pandas to requirements.txt`
- `refactor(model): split training loop into separate module`
- `chore(git): update .gitignore to exclude work/ folder`
- `exp(notebook): test quarterly sliding window analysis`

---

## Data Science–Specific Examples

### Data Handling
- `data(cleaning): remove duplicates and handle missing values`
- `data(preprocessing): normalize lottery numbers`

### Exploratory Data Analysis
- `feat(eda): compute k-gram distributions`
- `feat(eda): add quarterly window analysis`

### Modeling
- `feat(model): implement basic Markov chain for lottery sequence`
- `refactor(model): move transition matrix calculation to utils.py`

### Visualization
- `feat(viz): add bar plots for observed vs expected frequencies`
- `fix(viz): correct axis labels in histogram`

### Reports / Whitepaper
- `docs(report): draft randomness vs bias section`
- `docs(slides): add visuals for gambler’s fallacy section`

---

## Tips
- Keep messages short but informative.
- Use imperative mood: *“add EDA notebook”*, not *“added EDA notebook”*.
- Scope helps when your project grows: `feat(viz): …` vs `feat(model): …`.
- For experiments, use `exp:` so it’s clear the result might be disposable.

---
