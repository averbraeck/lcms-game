package nl.tudelft.simulation.lcms.util;

import java.security.SecureRandom;
import java.util.Base64;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/**
 * PasswordUtil contains utilities for password hashing and checking. The PBKDF2 password is stored as
 * <code>PBKDF2$iterations$salt$hash</code>.
 * <p>
 * Copyright (c) 2026-2026 Delft University of Technology, PO Box 5, 2600 AA, Delft, the Netherlands. All rights reserved. <br>
 * BSD-3 style license.
 * @author <a href="https://github.com/averbraeck">Alexander Verbraeck</a>
 */
public final class PasswordUtil
{
    private static final int ITERATIONS = 65536;

    private static final int KEY_LENGTH = 256;

    private PasswordUtil()
    {
    }

    public static String hashPassword(String password) throws Exception
    {
        byte[] salt = new byte[16];

        SecureRandom.getInstanceStrong().nextBytes(salt);

        byte[] hash = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256")
            .generateSecret(new PBEKeySpec(password.toCharArray(), salt, ITERATIONS, KEY_LENGTH))
            .getEncoded();

        return "PBKDF2$" + ITERATIONS + "$" + Base64.getEncoder().encodeToString(salt) + "$"
                + Base64.getEncoder().encodeToString(hash);
    }

    public static boolean verify(String password, String stored) throws Exception
    {
        String[] parts = stored.split("\\$");

        int iterations = Integer.parseInt(parts[1]);

        byte[] salt = Base64.getDecoder().decode(parts[2]);

        byte[] expectedHash = Base64.getDecoder().decode(parts[3]);

        byte[] actualHash = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256")
            .generateSecret(new PBEKeySpec(password.toCharArray(), salt, iterations, KEY_LENGTH))
            .getEncoded();

        return java.security.MessageDigest.isEqual(expectedHash, actualHash);
    }
}
