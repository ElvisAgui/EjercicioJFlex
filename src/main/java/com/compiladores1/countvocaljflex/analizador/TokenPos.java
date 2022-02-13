package com.compiladores1.countvocaljflex.analizador;

/**
 *
 * @author elvis_agui
 */
public class TokenPos {

    private int posColumna;
    private int posFila;
    private String numero;

    public TokenPos(int posColumna, int posFila, String numero) {
        this.posColumna = posColumna;
        this.posFila = posFila;
        this.numero = numero;
    }

    public int getPosColumna() {
        return posColumna;
    }

    public void setPosColumna(int posColumna) {
        this.posColumna = posColumna;
    }

    public int getPosFila() {
        return posFila;
    }

    public void setPosFila(int posFila) {
        this.posFila = posFila;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    @Override
    public String toString() {
        return "Entero-- " + "pos-Columna = " + posColumna + ", pos-Fila = "  + posFila + ", numero = " + numero ;
    }

}
