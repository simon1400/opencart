{css name="copilot-lety-print" file="`$config.root`/css/rack/copilot/flight.print.css"}

<h1>Let #{$let.id}</h1>

<table border="0" class="notable" width="100%">
  <tr>
    <td valign="top" width="50%">
      <table width="100%" class="notable">
        <tr>
          <td width="20%" align="right">datum:</td>
          <td width="80%">{$let.datum}&nbsp;{if $let.deni_doba == 'AM'}ráno{else}večer{/if}</td>
        </tr>
        <tr>
          <td align="right">pilot:</td>
          <td>{$piloti[$let.pilot].name}</td>
        </tr>
        <tr>
          <td align="right">balon:</td>
          <td>{$balony[$let.balon].name}</td>
        </tr>
        <tr>
          <td align="right">auto:</td>
          <td>{$auta[$let.auto].name}</td>
        </tr>
        <tr>
          <td align="right">lokalita:</td>
          <td>{$locations[$let.lokalita].name}</td>
        </tr>
        <tr>
          <td align="right" valign="top">poznámka:</td>
          <td>{$let.poznamka_k_letu}</td>
        </tr>
      </table>
    </td>
    <td valign="top" width="50%">
      <table width="100%" class="notable">
        <tr>
          <td width="20%" align="right">1.&nbsp;posádka:</td>
          <td width="80%">{$posadka[$let.posadka_1].name}</td>
        </tr>
        <tr>
          <td align="right">2.&nbsp;posádka:</td>
          <td>{$posadka[$let.posadka_2].name}</td>
        </tr>
        <tr>
          <td align="right">3.&nbsp;posádka:</td>
          <td>{$posadka[$let.posadka_3].name}</td>
        </tr>
      </table>
    </td>
  </tr>
</table>

<h2>Letenky:</h2>

<table width="100%" border="0">
{foreach from=$letenky item=row}
<tr class="double-border">
  <td valign="top"><strong>{$row.key}</strong></td>
  <td class="no-padd">
    <table width="100%" border="0">
    <tr>
      <td class="w84p" width="70%">
        {if ($row.passenger_name || $row.passenger_scname) || ($row.passenger_name == $row.purchaser_name && $row.passenger_scname == $row.purchaser_scname)}
        <strong class="passenger">{$row.passenger_name} {$row.passenger_scname} {$row.passenger_mobile}</strong>
        {else}
        <span class="purchaser">{$row.purchaser_name} {$row.purchaser_scname} {$row.purchaser_mobile}</span>
        {/if}
        {if $row.ticket_group}, skupina: {$row.ticket_group}{/if}
        <br />
        {$row.name} {$row.location_name} {$row.term}<br />
        poznámky: {$row.location_note}
        {$row.term_note}
        {$row.note_admin}
        {$row.note_ticket}
      </td>
      <td class="nowrap w8px" align="right" valign="top" width="15%">{$row.price|nice_price}Kč</td>
      <td class="nowrap w8px" align="right" valign="top" width="15%">{$row.doplatek|nice_price}Kč</td>
    </tr>
    </table>
  </td>
</tr>
{if $row.lety}
<tr>
  <td align="right" valign="top"><strong>lety</strong></td>
  <td class="no-padd">
    <table width="100%" border="0">
      <thead>
        <tr>
          <th>#</th>
          <th>datum</th>
          <th>lokalita</th>
          <th>balon</th>
          <th>pilot</th>
          <th>auto</th>
          <th>stav</th>
          {*<th></th>*}
        </tr>
      </thead>
      {foreach from=$row.lety item=row}
        <tr>
          <td>{$row.id}</td>
          <td>{$row.datum}&nbsp;{$row.deni_doba}</td>
          <td>{$row.lokalita}</td>
          <td>{$row.balon}</td>
          <td>{$row.pilot}</td>
          <td>{$row.auto}</td>
          <td>{$row.status}</td>
          {*<td class="last"><a style="position: relative" class="icn page_edit" href="/cs/rack/copilot/lety/edit/{$row.id}"><span>e</span></a></td>*}
        </tr>
      {/foreach}
    </table>
  </td>
</tr>
{/if}
{/foreach}
</table>
{if $letenky}
  {assign var="hmotnosttotal" value=0}
  <p>
    hmotnosti: {foreach from=$letenky item=row name="letenky"}
    {assign var="hmotnosttotal" value=$hmotnosttotal+$row.hmotnost}{$row.hmotnost|default:'0'}{if !$smarty.foreach.letenky.last} + {/if}{/foreach} = {$hmotnosttotal} Kg
  </p>
{/if}


{if $let.poznamka}
<p>
poznámka: {$let.poznamka}
</p>
{/if}
