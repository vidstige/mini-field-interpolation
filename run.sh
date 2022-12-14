#!/bin/bash
set -e
VENV_PATH="venv"
REQUIREMENTS_TXT="requirements.txt"
if cmp --silent "$VENV_PATH/requirements.txt" "${REQUIREMENTS_TXT}"; then
    source "$VENV_PATH/bin/activate"
else
    echo "Creating virtual environment..."
    rm -rf "$VENV_PATH"
    python3 -m venv "$VENV_PATH"
    source "$VENV_PATH/bin/activate"
    pip install --quiet --disable-pip-version-check --upgrade pip
    pip install --quiet wheel
    pip install --quiet -r "${REQUIREMENTS_TXT}"
    cp "${REQUIREMENTS_TXT}" "$VENV_PATH/requirements.txt"
fi

jt --theme chesterish
jupyter notebook field_interpolation.ipynb
