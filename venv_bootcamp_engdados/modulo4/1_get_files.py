import os
import pandas as pd 
import numpy as np
import warnings

# File dir
FILENAME = r"./enem_data/microdados_enem_2020/DADOS/MICRODADOS_ENEM_2020.csv"
# Numpy configs
warnings.filterwarnings("error")
np.seterr("warn")

def create_chunks(filename,max_rows=100000,type_encoding="utf-8",has_header=True,delimiter=","):
    max_rows_chunks = max_rows
    chunks = {}
    count=0
    offset = 0
    df = np.loadtxt(filename,delimiter=delimiter,dtype=np.ndarray,encoding=type_encoding,max_rows=max_rows_chunks)
    while len(df)!=0:
        count+=1
        print(f"lendo o chunk {count}")
        chunks[f"df_{count}"]=df
        offset+=max_rows_chunks
        try:
            df = np.loadtxt(filename,delimiter=delimiter,dtype=np.ndarray,encoding=type_encoding,
            max_rows=max_rows_chunks,skiprows=offset)
        except UserWarning as err:
            if "input contained no data" in str(err):
                df = np.array([])
    

    
    if has_header:
        cols = chunks["df_1"][0]
        #drop first line after we catch the columns
        new_data_df1 = chunks["df_1"][1:]
        chunks["df_1"] = new_data_df1

    else:
        cols = [i for i in range(len(chunks["df_1"][0]))]
    
    print(f"Fim do processamento temos: {len(chunks)} chunks e {len(cols)} colunas")
    
    return chunks,cols


def divide_csv(filename,max_rows=100000,type_encoding="utf-8",has_header=True,delimiter=",",output_path="./"):
    chunks,columns = create_chunks(filename,max_rows=max_rows,type_encoding=type_encoding,has_header=has_header,delimiter=delimiter)
    for name,data in chunks.items():
        print(f"Criando csv para chunk {name}")
        output_dir = os.path.join(output_path,f"{name}.csv")
        df = pd.DataFrame(data=data,columns=columns)
        df.to_csv(output_dir,sep=",",encoding=type_encoding,index=False)

if __name__ == "__main__":
    # Search for encoding
    with open(FILENAME) as f:
        file_encoding = f.encoding
        print("encoding: ",f.encoding)
    f.close()
    # Create dir to save files
    try:
        os.mkdir("./dados_enem_2020_partes/")
    except FileExistsError as err:
        print("Diretório já existente")
    output_path = "./dados_enem_2020_partes/"
    # Divide the csv file 
    divide_csv(FILENAME,max_rows=500000,type_encoding=file_encoding,delimiter=";",output_path=output_path)
    # Checking first chunk
    # test = pd.read_csv("./dados_enem_2020_partes/df_1.csv",encoding=type_encoding)
    # print("shape_first_csv: ", test.shape)