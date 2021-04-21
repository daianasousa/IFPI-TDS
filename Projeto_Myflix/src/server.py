from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session
from src.schema.schemas import Serie
from src.infra.sqlalchemy.config.database import get_db, criar_bd
from src.infra.sqlalchemy.repositorios.serie import RepositorioSerie

criar_bd()

app = FastAPI()


@app.post('/series')
def cadastra_series(serie: Serie, db: Session = Depends(get_db)):
    serie_cadastrada = RepositorioSerie(db).cadastrar(serie)
    return serie_cadastrada


@app.get('/series')
def listar_series(db: Session = Depends(get_db)):
    serie = RepositorioSerie(db).listar()
    return serie

@app.get('/series/{serie_id}')
def obter_serie(serie_id: int, db: Session = Depends(get_db)):
    serie = RepositorioSerie(db).obter(serie_id)
    return serie

@app.put('/series/{titulo}')
def listar_titulo(titulo: str, db: Session = Depends(get_db)):
    series_titulo = RepositorioSerie(db).exibir_titulo(titulo)
    return series_titulo


@app.delete('/series/{serie_id}')
def obter_serie(serie_id: int, db: Session = Depends(get_db)):
    RepositorioSerie(db).remover(serie_id)
    return {"msg": "Removido com sucesso"}