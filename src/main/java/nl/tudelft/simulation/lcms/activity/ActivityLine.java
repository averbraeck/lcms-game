package nl.tudelft.simulation.lcms.activity;

/**
 * ActivityLine contains the data for one line in an activity table.
 * <p>
 * Copyright (c) 2026-2026 Delft University of Technology, PO Box 5, 2600 AA, Delft, the Netherlands. All rights reserved. <br>
 * BSD-3 style license.
 * @author <a href="https://github.com/averbraeck">Alexander Verbraeck</a>
 */
public record ActivityLine(int id, boolean tick, String naam, String opschalingCode, String organisatieNaam,
        String aanmaakDatum, String wijzigDatum, boolean nieuw)
{
}
