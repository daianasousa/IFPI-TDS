from fastapi import FastAPI
from pydantic import BaseModel
from typing import List, Optional
from uuid import uuid4

app = FastAPI()

class Bicho(BaseModel):
    id: Optional[str]
    Nome: str
    Idade: int
    Sexo: str
    Cor: str

lista_cadastral: List[Bicho] = []


@app.get('/Animais')
def retornar():
    return lista_cadastral

@app.get('/Animais/{id}')
def buscar_id(id: str):
    for animal in lista_cadastral:
        if animal.id == id:
            return animal
    return {'mensagem': 'Erro ao localizar animal'}

@app.delete('/Animais/{id}')
def apagar_id(id: str):
    cont = -1
    for pos, animal in enumerate(lista_cadastral):
        if animal.id == id:
            cont = pos
            break
    if cont != -1:
        lista_cadastral.pop(cont)
        return {'Mensagem': 'animal excluido com sucesso!'}
    else:
        return {'Erro': 'Animal não encontrado!'}

@app.post('/Animais')
def objeto(animal: Bicho):
    animal.id = str(uuid4())
    lista_cadastral.append(animal)
    return animal