<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:iso="urn:iso:std:iso:20022:tech:xsd:pain.001.001.03" exclude-result-prefixes="iso">

    <xsl:output method="html" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

    <!-- Root template -->
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>ISO 20022 Payment Initiation (pain.001.001.03)</title>

                <style type="text/css">
                    body {
                        font-family: 'Roboto', sans-serif;
                        background-color: #f5f5f5;
                        margin: 0;
                        padding: 0;
                    }
                    .container {
                        margin: auto;
                        background-color: #fff;
                        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                        padding: 20px;
                        margin-top: 20px;
                        margin-left: 3rem;
                        margin-right: 3rem;
                        display:flex; 
                        flex-direction:column;
                    }
                    h1, h2, h3 {
                        color: #333;
                    }
                    table {
                        border-collapse: collapse;
                        border:1px solid #999;
                        flex:1;
                    }
                    .horizontal-table{
                        table-layout:fixed;
                    }
                    
                    
                    .horizontal-table th{
                        width:20rem;
                    }
                    
                    th, td {
                        text-align: left;
                        padding: 8px;
                        border-bottom: 1px solid #ddd;
                    }
                    th {
                        background-color: #f2f2f2;
                        max-
                    }
                    
                    .card{
                        padding: 16px; 
                        margin: 10px 0; 
                        background-color: #fff; 
                        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2); 
                        transition: 0.3s;
                        display:flex; 
                        flex-direction:column;
                    }
                </style>

            </head>
            <body class="container">
                <h1>Payment Initiation (pain.001.001.03)</h1>
                <xsl:apply-templates select="iso:Document/*"/>
            </body>
        </html>
    </xsl:template>

    <!-- Template for Customer Credit Transfer Initiation -->
    <xsl:template match="iso:CstmrCdtTrfInitn">
        <h2>Initiating Party Information</h2>
        <table class="horizontal-table">
            <tr>
                <th>Name</th>
                <td>
                    <xsl:value-of select="iso:GrpHdr/iso:InitgPty/iso:Nm"/>
                </td>
            </tr>
            <tr>
                <th>Message Identification</th>
                <td>
                    <xsl:value-of select="iso:GrpHdr/iso:MsgId"/>
                </td>
            </tr>
            <tr>
                <th>Creation Date and Time</th>
                <td>
                    <xsl:value-of select="iso:GrpHdr/iso:CreDtTm"/>
                </td>
            </tr>
            <tr>
                <th>Number of Transactions</th>
                <td>
                    <xsl:value-of select="iso:GrpHdr/iso:NbOfTxs"/>
                </td>
            </tr>
            <tr>
                <th>Control Sum</th>
                <td>
                    <xsl:value-of select="iso:GrpHdr/iso:CtrlSum"/>
                </td>
            </tr>
            <tr>
                <th>Initiating Party Name</th>
                <td>
                    <xsl:value-of select="iso:GrpHdr/iso:InitgPty/iso:Nm"/>
                </td>
            </tr>
            <tr>
                <th>Initiating Party ID</th>
                <td>
                    <xsl:value-of select="iso:GrpHdr/iso:InitgPty/iso:Id/iso:OrgId/iso:Othr/iso:Id"/>
                </td>
            </tr>

        </table>
        <xsl:apply-templates select="iso:PmtInf"/>
    </xsl:template>

    <!-- Template for Payment Information -->
    <xsl:template match="iso:PmtInf">
        <h3>Payment Information</h3>
        <table class="horizontal-table">
            <tr>
                <th>Payment Information ID</th>
                <td>
                    <xsl:value-of select="iso:PmtInfId"/>
                </td>
            </tr>
            <tr>
                <th>Payment Method</th>
                <td>
                    <xsl:value-of select="iso:PmtMtd"/>
                </td>
            </tr>
            <tr>
                <th>Requested Execution Date</th>
                <td>
                    <xsl:value-of select="iso:ReqdExctnDt"/>
                </td>
            </tr>

        </table>

        <h4>Debtor Information</h4>
        <table class="horizontal-table">
            <tr>
                <th>Debtor Name</th>
                <td>
                    <xsl:value-of select="iso:Dbtr/iso:Nm"/>
                </td>
            </tr>
            <tr>
                <th>Debtor Address Type</th>
                <td>
                    <xsl:value-of select="iso:Dbtr/iso:PstlAdr/iso:AdrTp"/>
                </td>
            </tr>
            <tr>
                <th>Debtor Street Name</th>
                <td>
                    <xsl:value-of select="iso:Dbtr/iso:PstlAdr/iso:StrtNm"/>
                </td>
            </tr>
            <tr>
                <th>Debtor Building Number</th>
                <td>
                    <xsl:value-of select="iso:Dbtr/iso:PstlAdr/iso:BldgNb"/>
                </td>
            </tr>
            <tr>
                <th>Debtor Post Code</th>
                <td>
                    <xsl:value-of select="iso:Dbtr/iso:PstlAdr/iso:PstCd"/>
                </td>
            </tr>
            <tr>
                <th>Debtor Town Name</th>
                <td>
                    <xsl:value-of select="iso:Dbtr/iso:PstlAdr/iso:TwnNm"/>
                </td>
            </tr>
            <tr>
                <th>Debtor Country</th>
                <td>
                    <xsl:value-of select="iso:Dbtr/iso:PstlAdr/iso:Ctry"/>
                </td>
            </tr>
        </table>

        <h4>Debtor Account Information</h4>
        <table class="horizontal-table">
            <tr>
                <th>Debtor Account Name</th>
                <td>
                    <xsl:value-of select="iso:DbtrAcct/iso:Nm"/>
                </td>
            </tr>
            <tr>
                <th>Debtor Account Currency</th>
                <td>
                    <xsl:value-of select="iso:DbtrAcct/iso:Ccy"/>
                </td>
            </tr>
            <tr>
                <th>Debtor Account ID</th>
                <td>
                    <xsl:value-of select="iso:DbtrAcct/iso:Id/iso:Othr/iso:Id"/>
                </td>
            </tr>
        </table>

        <xsl:apply-templates select="iso:CdtTrfTxInf"/>
    </xsl:template>

    <!-- Template for Credit Transfer Transaction Information -->
    <xsl:template match="iso:CdtTrfTxInf">
        <div class="card">
            <xsl:apply-templates select="iso:Cdtr"/>
            <table>
                <tr>
                    <th>Transaction E2E ID</th>
                    <th>Amount</th>
                    <th>Currency</th>
                    <th>Branch Identifier</th>
                    <th>Branch Name</th>
                    <th>Account Id</th>
                </tr>
                <tr>
                    <td>
                        <xsl:value-of select="iso:PmtId/iso:EndToEndId"/>
                    </td>
                    <td>
                        <xsl:value-of select="iso:Amt/iso:InstdAmt"/>
                    </td>
                    <td>
                        <xsl:value-of select="iso:Amt/iso:InstdAmt/@Ccy"/>
                    </td>

                    <td>
                        <xsl:value-of select="iso:CdtrAgt/iso:BrnchId/iso:Id"/>
                    </td>

                    <td>
                        <xsl:value-of select="iso:CdtrAgt/iso:BrnchId/iso:Nm"/>
                    </td>
                    <td>
                        <xsl:value-of select="iso:CdtrAcct/iso:Id/iso:Othr/iso:Id"/>
                    </td>
                </tr>
            </table>
        </div>
    </xsl:template>

    <!-- Template for Credit Transfer -->
    <xsl:template match="iso:Cdtr">
        <h2>Creditor Information</h2>
        <p>
            <b>Name:</b>
            <xsl:value-of select="iso:Nm"/>
        </p>
        <p>
            <b>Postal Address:</b>
            <xsl:value-of select="iso:PstlAdr/iso:AdrLine"/>
        </p>
        <p>
            <b>Country:</b>
            <xsl:value-of select="iso:PstlAdr/iso:Ctry"/>
        </p>
        <p>
            <b>City:</b>
            <xsl:value-of select="iso:PstlAdr/iso:TwnNm"/>
        </p>
        <p>
            <b>Street:</b>
            <xsl:value-of select="iso:PstlAdr/iso:StrtNm"/>
        </p>
        <p>
            <b>Building Number:</b>
            <xsl:value-of select="iso:PstlAdr/iso:BldgNb"/>
        </p>
        <p>
            <b>Postal Code:</b>
            <xsl:value-of select="iso:PstlAdr/iso:PstCd"/>
        </p>
        <p>
            <b>Employee Id:</b>
            <xsl:value-of select="iso:Id/iso:OrgId/iso:Othr/iso:Id"/>
        </p>
    </xsl:template>
</xsl:stylesheet>
