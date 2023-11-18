# Project
    - CORE: 
        - Extract: 
            From google drive source 
        - Load 
            To local database 
    - DBT
        - Transform
            SQL scripts in elt/dbt/models
    - init_db
        - initial configuration for the database
            create extract schemas
            configure users and permissions
### Requirements
    DBT:
        https://docs.getdbt.com/docs/core/installation
    pyenv:
        - install:
            https://github.com/pyenv/pyenv#readme
        - create env: 
            pyenv virtualenv 3.8.10 beev_python_env
        - activate_env: 
            pyenv activate beev_python_env
        - install_requirements:
            pip install -r requirements.txt 
        - check_installed_libraries: 
            pip freeze
        - delete_all_libraries: #caution
            pip freeze | xargs pip uninstall -y
## insert diagram
