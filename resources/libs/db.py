import psycopg2

def remove_customer_bye_cpf(cpf):

    cpf_formatado = cpf[:3] + "." + cpf[3:6] + "." + cpf[6:9] + "-" + cpf[9:]

    # abre uma conexão com o banco de dados
    conn = psycopg2.connect(
        host='zepalheta-postgres',
        database='zepalheta',
        user='postgres',
        password='qaninja'
    )

    query = "delete from public.customers where cpf = '{}';".format(cpf_formatado)
    print(query)
    # abre um curso dentro da conexão db
    cur = conn.cursor()
    # executa um comando do db 
    cur.execute(query)

    #Commitar antes de fechar
    conn.commit()


    # Fecha curso 
    cur.close()
    #Fecha conexaão
    conn.close()