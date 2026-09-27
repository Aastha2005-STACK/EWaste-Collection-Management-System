<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="/">

        <html>

            <head>
                <title>E-Waste Feedback</title>

                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f2f7f2;
                        padding: 30px;
                    }

                    h2 {
                        text-align: center;
                        color: #2e7d32;
                    }

                    table {
                        width: 90%;
                        margin: auto;
                        border-collapse: collapse;
                        background-color: white;
                    }

                    th, td {
                        border: 1px solid #ccc;
                        padding: 10px;
                        text-align: left;
                    }

                    th {
                        background-color: #2e7d32;
                        color: white;
                    }
                </style>
            </head>

            <body>

                <h2>Customer Feedback</h2>

                <table>

                    <tr>
                        <th>Name</th>
                        <th>Rating</th>
                        <th>Comment</th>
                    </tr>

                    <xsl:for-each select="feedbacks/feedback">

                        <tr>

                            <td>
                                <xsl:value-of select="name"/>
                            </td>

                            <td>
                                <xsl:value-of select="rating"/>
                            </td>

                            <td>
                                <xsl:value-of select="comment"/>
                            </td>

                        </tr>

                    </xsl:for-each>

                </table>

            </body>

        </html>

    </xsl:template>

</xsl:stylesheet>