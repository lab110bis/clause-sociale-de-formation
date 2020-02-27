export $(scalingo --app clause-sociale-de-formation --region osc-fr1 env | grep "^SCALINGO_POSTGRESQL")
echo -e "\n  Exécuter la commande suivante dans une autre fenêtre avant de taper votre mot de passe :\n"
echo -e "scalingo -a clause-sociale-de-formation --region osc-fr1 db-tunnel $SCALINGO_POSTGRESQL_URL\n"

pg_dump csf_development --format=c -U csf -W -h localhost > pg_backup.bak
export $(scalingo --app clause-sociale-de-formation --region osc-fr1 env | grep "^SCALINGO_POSTGRESQL" |sed -- "s/@.*\//@127.0.0.1:10000\//")
pg_restore -e -n public --clean --format=c --no-owner --no-privileges --dbname $SCALINGO_POSTGRESQL_URL pg_backup.bak

