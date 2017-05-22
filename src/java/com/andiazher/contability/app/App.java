/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.andiazher.contability.app;

import com.andiazher.contability.db.ConnectionMysql;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author andre
 */
public class App {
    
    public final static String versionCompilation="V1.03";
    private static ConnectionMysql connectionMysql = new ConnectionMysql();
    
    //TABLES
    public static String TABLE_LOGIN = "login";
    public static String TABLE_USERS = "usuarios";
    
    public static ResultSet consult(String sql) throws SQLException{
        if(connectionMysql.getConnection()==null){
            connectionMysql.conectar();
        }
        sql+=" LIMIT 100";
        ResultSet resultSet = connectionMysql.consultar(sql);
        //System.out.println("SQL: "+sql);
        //connectionMysql.desconectar();
        return resultSet;
    }
    public static boolean update(String sql) throws SQLException{
        if(connectionMysql.getConnection()==null){
            connectionMysql.conectar();
        }
        System.out.println("SQL: "+sql);
        return connectionMysql.escribir(sql);
    }

    public static ConnectionMysql getConnectionMysql() {
        return connectionMysql;
    }

    public static void setConnectionMysql(ConnectionMysql connectionMysql) {
        App.connectionMysql = connectionMysql;
    }
    
    public static String getVersionApp(){
        return versionCompilation;
    }
    
}
