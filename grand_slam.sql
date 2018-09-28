SHOW DATABASES;
CREATE DATABASE grand_slam;
USE grand_slam;
CREATE TABLE arbitro(id_arbitro INT AUTO_INCREMENT,nombre VARCHAR(50),PRIMARY KEY(id_arbitro));
CREATE TABLE jugador(id_jugador INT AUTO_INCREMENT , nombre VARCHAR(50),edad INT, genero VARCHAR(25),PRIMARY KEY(id_jugador));
CREATE TABLE entrenador(id_entrenador INT AUTO_INCREMENT,nombre VARCHAR(50),PRIMARY KEY (id_entrenador));
CREATE TABLE nacionalidad(id_nacionalidad INT AUTO_INCREMENT,PRIMARY KEY(id_nacionalidad),pais VARCHAR(20));
CREATE TABLE sede(id_sede INT AUTO_INCREMENT,n_canchas INT NOT NULL,ciudad VARCHAR(50),pais VARCHAR(50),PRIMARY KEY(id_sede));
CREATE TABLE torneo(id_torneo INT AUTO_INCREMENT,id_sede INT,nombre VARCHAR(50),fecha VARCHAR(50),FOREIGN KEY fk_sede(id_sede) REFERENCES sede(id_sede),PRIMARY KEY(id_torneo));
CREATE TABLE modalidad(id_modalidad INT AUTO_INCREMENT,id_torneo INT,tipo VARCHAR(50),genero VARCHAR(50),FOREIGN KEY fk_torneo(id_torneo) REFERENCES torneo(id_torneo),PRIMARY KEY(id_modalidad));
CREATE TABLE fase(id_fase INT AUTO_INCREMENT,id_modalidad INT,nombre VARCHAR(50),FOREIGN KEY fk_modalidad(id_modalidad) REFERENCES modalidad(id_modalidad),PRIMARY KEY(id_fase));
CREATE TABLE tenern(id_nacionalidad INT, id_jugador INT,FOREIGN KEY fk_nacionalidad(id_nacionalidad) REFERENCES nacionalidad(id_nacionalidad),FOREIGN KEY fk_jugador(id_jugador) REFERENCES jugador(id_jugador),PRIMARY KEY(id_jugador,id_nacionalidad));
CREATE TABLE entrenar(id_jugador INT,id_entrenador INT ,FOREIGN KEY fk_jugado(id_jugador) REFERENCES jugador(id_jugador),FOREIGN KEY fk_entrenado(id_entrenador) REFERENCES entrenador(id_entrenador),fi VARCHAR(50),ff VARCHAR(50),PRIMARY KEY(id_entrenador,id_jugador));
CREATE TABLE partido(id_partido INT AUTO_INCREMENT,id_arbitro INT,id_fase INT , FOREIGN KEY fk_arbitr(id_arbitro) REFERENCES arbitro(id_arbitro),FOREIGN KEY fk_fas(id_fase) REFERENCES fase(id_fase),fecha VARCHAR(50),PRIMARY KEY(id_partido));
CREATE TABLE jugar(ganar VARCHAR(50),id_jugador INT,id_partido INT,FOREIGN KEY fk_jugad(id_jugador) REFERENCES jugador(id_jugador),FOREIGN KEY fk_parti(id_partido) REFERENCES partido(id_partido),PRIMARY KEY(id_partido,id_jugador));
CREATE TABLE tener(id_nacionalidad INT,id_arbitro INT,FOREIGN KEY fk_nacionali(id_nacionalidad) REFERENCES nacionalidad(id_nacionalidad),FOREIGN KEY fk_arb(id_arbitro) REFERENCES arbitro(id_arbitro),PRIMARY KEY(id_arbitro,id_nacionalidad));