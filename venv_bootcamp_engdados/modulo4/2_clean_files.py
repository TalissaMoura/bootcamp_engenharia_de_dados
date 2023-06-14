import pandas as pd 
import numpy as np 
import os

FILENAME =  r"./dados_enem_2020_partes/"
type_encoding = "cp1252"

def process_data(df):
    
    new_df = df.copy()
    if "Unnamed: 0" in new_df.columns:
        new_df.drop(["Unnamed: 0"],axis=1,inplace=True)
    
    #replace tp_lingua
    new_df.loc[:,"TP_LINGUA"] = new_df["TP_LINGUA"].map({0:"Inglês",1:"Espanhol"})
    #replace tp_escola
    new_df.loc[:,"TP_ESCOLA"] = new_df["TP_ESCOLA"].map({1:"Não respondeu", 2:"Pública", 3:"Privada", 4:"Exterior"})
    #replace tp_cor_raça
    new_df.loc[:,"TP_COR_RACA"] = new_df["TP_COR_RACA"].map({0:"Não Declarado", 1:"Branca", 2:"Preto", 
    3:"Parda",4:"Amarela",5:"Indígena"})

    new_df = new_df.loc[new_df.loc[:,"SG_UF_PROVA"]=="MG"]

    return new_df

if __name__=="__main__":
    dfs = []
    filenames = os.listdir(FILENAME)

    for file in filenames:
        print(f"Lendo arquivo {file}")
        df = pd.read_csv(os.path.join(FILENAME,file),encoding=type_encoding)
        filtered_df = process_data(df)
        dfs.append(filtered_df)
    
    print("Finalizou limpeza! Reuinindo dados ...")
    final_df = pd.concat(dfs)
    final_df.to_csv("./filtered_df_enem2020_mg.csv",index=False)

