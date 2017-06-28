/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.andiazher.contability.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author andre
 */
public class Json {
    
    Map<String, Object> object;

    public Json() {
        object= new HashMap<>();
    }
    
    public void add(String key, String value){
        object.put(key, value);
    }
    
    public void add(String key, Json value){
        object.put(key, value);
    }

    @Override
    public String toString() {
        String s = "";
        String k = "";
        for(Map.Entry<String, Object> j: object.entrySet()){
            s+=k;
            if(j.getValue().getClass().equals(Json.class)){
                s+="{ \""+j.getKey()+"\""+" : \n    "+"  "+j.getValue()+"  } ";
            }
            else{
                s+="{ \""+j.getKey()+"\""+":"+"\""+j.getValue()+"\" } ";
            }
            k=", \n";
        }
        return s;
    }
    
    public static void main(String[] args) {
        Json j= new Json();
        j.add("name", "Andres Diaz");
        j.add("edad", "22");
        Json k= new Json();
        k.add("name1", "Lucy");
        k.add("edad", "21");
        k.add("novio", "Andres");
        Json l= new Json();
        l.add("Ojos", "Cafes");
        k.add("otros", l);
        
        j.add("novia", k);
        j.add("sexo", "Mas");
        j.add("novia2", k);
        
        System.out.println(j);
    }
    
}
