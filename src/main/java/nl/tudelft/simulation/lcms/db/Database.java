package nl.tudelft.simulation.lcms.db;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.sql.DataSource;

import org.jooq.DSLContext;
import org.jooq.SQLDialect;
import org.jooq.impl.DSL;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

/**
 * Database.java.
 * <p>
 * Copyright (c) 2026-2026 Delft University of Technology, PO Box 5, 2600 AA, Delft, the Netherlands. All rights reserved. <br>
 * BSD-3 style license.
 * @author <a href="https://github.com/averbraeck">Alexander Verbraeck</a>
 */
public final class Database
{
    private static DataSource dataSource;

    private Database()
    {
        // utility class
    }

    public static synchronized void initialize() throws IOException
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("MySQL driver found");
        }
        catch (ClassNotFoundException e)
        {
            e.printStackTrace();
            System.exit(-1);
        }
        
        if (dataSource != null)
            return;

        String home = System.getProperty("user.home");

        Properties properties = new Properties();

        try (FileInputStream fis = new FileInputStream(new File(home + "/lcms/lcms.properties")))
        {
            properties.load(fis);
        }

        String dbUser = properties.getProperty("dbUser");
        String dbPassword = properties.getProperty("dbPassword");

        HikariConfig config = new HikariConfig();

        config.setJdbcUrl("jdbc:mysql://localhost:3306/lcms");

        config.setUsername(dbUser);
        config.setPassword(dbPassword);

        config.setMaximumPoolSize(10);

        dataSource = new HikariDataSource(config);
    }

    public static DataSource getDataSource()
    {
        return dataSource;
    }

    public static DSLContext dsl()
    {
        return DSL.using(dataSource, SQLDialect.MARIADB);
    }
}
