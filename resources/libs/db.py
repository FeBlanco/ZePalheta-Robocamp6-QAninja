import psycopg2

def execute_q(query):
     ## abre uma conexão com o banco de dados
    conn = psycopg2.connect(
        host='zepalheta-postgres',
        database='zepalheta',
        user='postgres',
        password='qaninja'
    )

    ## abre um curso dentro da conexão db
    cur = conn.cursor()

    ## executa um comando do db 
    cur.execute(query)

    ##Commitar antes de fechar
    conn.commit()


    ## Fecha curso 
    cur.close()
    ##Fecha conexaão
    conn.close()

def format_cpf(cpf):
    return cpf[:3] + "." + cpf[3:6] + "." + cpf[6:9] + "-" + cpf[9:]

def insert_customer(name, cpf, address, phone):

    cpf_formatado = format_cpf(cpf)

    query = "insert into public.customers(name, cpf, address, phone_number) "\
	    "values ('{}', '{}', '{}', '{}')".format(name, cpf_formatado, address, phone)
    print(query)

    execute_q(query)

def remove_customer_by_cpf(cpf):

    cpf_formatado = format_cpf(cpf)

    query = "delete from public.customers where cpf = '{}';".format(cpf_formatado)
    print(query) 

    execute_q(query)