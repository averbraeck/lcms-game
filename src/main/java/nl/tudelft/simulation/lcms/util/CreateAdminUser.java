package nl.tudelft.simulation.lcms.util;

import org.jooq.DSLContext;
import nl.tudelft.simulation.lcms.db.Database;
import static nl.tudelft.simulation.lcms.data.Tables.ADMIN;

/**
 * One-time creation of admin user after the database has been (re)initialized.
 * <p>
 * Copyright (c) 2026-2026 Delft University of Technology, PO Box 5, 2600 AA, Delft, the Netherlands. All rights reserved. <br>
 * BSD-3 style license.
 * @author <a href="https://github.com/averbraeck">Alexander Verbraeck</a>
 */
public class CreateAdminUser
{
    public static void main(String[] args) throws Exception
    {
        Database.initialize();

        String username = "admin";
        String password = "admin";

        String hash = PasswordUtil.hashPassword(password);

        DSLContext dsl = Database.dsl();

        dsl.insertInto(ADMIN)
            .set(ADMIN.INLOG_NAAM, username)
            .set(ADMIN.PASSWORD_HASH, hash)
            .set(ADMIN.NAAM, "Admin")
            .set(ADMIN.ADMIN_, (byte) 1)
            .execute();

        System.out.println("Admin user created.");
    }
}
