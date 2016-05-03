for i in *.qb2014.sql.gz; do

  echo $i      
  /bin/gzip -d $i

  for j in *.qb2014.sql; do


    echo 'create database qb2014;' | mysql

    echo 'create user testuser@"localhost" identified by "duke851";' | mysql
    echo 'grant all on qb2014.* to testuser@"localhost";' | mysql

    #echo 'show databases;' | mysql

    mysql qb2014 < $j


    echo 'ALTER FUNCTION bankstatementbanktrans SQL SECURITY INVOKER;' | mysql qb2014
    echo 'ALTER FUNCTION finddborcr SQL SECURITY INVOKER;' | mysql qb2014
    echo 'ALTER FUNCTION findvendordrorcr SQL SECURITY INVOKER;' | mysql qb2014
    echo 'ALTER FUNCTION findvendormatchingbankstatement SQL SECURITY INVOKER;' | mysql qb2014
    echo 'ALTER FUNCTION gettotal SQL SECURITY INVOKER;' | mysql qb2014
    echo 'ALTER FUNCTION hidematchedbankitem SQL SECURITY INVOKER;' | mysql qb2014
    echo 'ALTER FUNCTION vendorinvoicebanktrans SQL SECURITY INVOKER;' | mysql qb2014


  done

done

for i in *_*.gz; do

  echo $i
  /bin/gzip -d $i

  name=${i%.*}
  name=${name%.*}
  name=${name#*.}
  echo $name


  echo "create database ${name};"
  echo "create database ${name};" | mysql

  echo "grant all on ${name}.* to testuser@'localhost';"
  echo "grant all on ${name}.* to testuser@'localhost';" | mysql

  echo "create user ${name}@'localhost' identified by '2pOBrNli';"
  echo "create user ${name}@'localhost' identified by '2pOBrNli';" | mysql

  echo "grant all on ${name}.* to ${name}@'localhost';"
  echo "grant all on ${name}.* to ${name}@'localhost';" | mysql

  for j in *${name}*sql; do
        mysql "${name}" < "${j}"
  done
done