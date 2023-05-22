#!/usr/bin/env bash
python3.10 -m venv venv && source venv/bin/activate && pip install --upgrade pip && pip install isort black pyright && echo "source venv/bin/activate" >> $PWD/.envrc && direnv allow
