from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from typing import List, Optional
from pydantic import BaseModel
from uuid import uuid4

app = FastAPI()

origins = ['http://localhost:5500']

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)


class Bicho(BaseModel):
    id: Optional[str]
    nome: str
    idade: int
    sexo: str
    cor: str

lista_cadastral: List[Bicho] = []


@app.get('/animais')
def retornar():
    return lista_cadastral

@app.get('/animais/{id}')
def buscar_id(id: str):
    for animal in lista_cadastral:
        if animal.id == id:
            return animal
    return {'mensagem': 'Erro ao localizar animal'}

@app.delete('/animais/{id}')
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

@app.post('/animais')
def objeto(animal: Bicho):
    animal.id = str(uuid4())
    lista_cadastral.append(animal)
    return None