FROM python:3.7.3
# Update pip
RUN pip install --upgrade pip
# Install ipykernel
RUN pip install ipykernel