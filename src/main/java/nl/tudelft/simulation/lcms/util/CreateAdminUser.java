package nl.tudelft.simulation.lcms.util;

import org.jooq.DSLContext;
import nl.tudelft.simulation.lcms.db.Database;
import static nl.tudelft.simulation.lcms.data.Tables.USER;

/**
 * One-time creation of USER user after the database has been (re)initialized.
 * <p>
 * Copyright (c) 2026-2026 Delft University of Technology, PO Box 5, 2600 AA, Delft, the Netherlands. All rights reserved. <br>
 * BSD-3 style license.
 * @author <a href="https://github.com/averbraeck">Alexander Verbraeck</a>
 */
public class CreateAdminUser
{
    public static void main(final String[] args) throws Exception
    {
        Database.initialize();

        String username = "admin";
        String password = "admin";

        String hash = PasswordUtil.hashPassword(password);

        DSLContext dsl = Database.dsl();

        dsl.insertInto(USER)
            .set(USER.LOGIN_NAME, username)
            .set(USER.PASSWORD_HASH, hash)
            .set(USER.NAME, "Administrator")
            .set(USER.ADMIN, (byte) 1)
            .set(USER.FACILITATOR, (byte) 0)
            .set(USER.RESEARCHER, (byte) 0)
            .execute();

        System.out.println("admin user created.");
    }
}
