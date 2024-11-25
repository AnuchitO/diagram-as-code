# Define the virtual environment directory
VENV_DIR=.venv

# Define the command to activate the virtual environment
ACTIVATE_CMD=source $(VENV_DIR)/bin/activate

# Define a target to create the virtual environment
.PHONY: create-venv
create-venv:
	python3 -m venv $(VENV_DIR)

# Define a target to install dependencies
.PHONY: install
install: create-venv
	$(ACTIVATE_CMD) && pip install -r requirements.txt

# Define a target to run your Python script
.PHONY: run
run: install
	$(ACTIVATE_CMD) && python app/aws.py

# Define a target to deactivate the virtual environment
.PHONY: deactivate
deactivate:
	@echo "Deactivate the virtual environment by simply closing the terminal or running 'deactivate' command in an active shell."

.PHONY: freeze
freeze:
	$(ACTIVATE_CMD) && pip freeze > requirements.txt

