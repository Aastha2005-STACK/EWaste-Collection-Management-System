<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">

        <html>

            <head>
                <title>Customer Feedback</title>

                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f4f4f4;
                        padding: 30px;
                    }

                    h2 {
                        text-align: center;
                    }

                    table {
                        width: 90%;
                        margin: auto;
                        border-collapse: collapse;
                        background-color: white;
                    }

                    th, td {
                        border: 1px solid black;
                        padding: 10px;
                        text-align: left;
                    }

                    th {
                        background-color: #dddddd;
                    }
                </style>
            </head>

            <body>

                <h2>Customer Feedback Details</h2>

                <table>

                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Rating</th>
                        <th>Category</th>
                        <th>Comment</th>
                    </tr>

                    <xsl:for-each select="feedbacks/feedback">

                        <tr>

                            <td>
                                <xsl:value-of select="name"/>
                            </td>

                            <td>
                                <xsl:value-of select="email"/>
                            </td>

                            <td>
                                <xsl:value-of select="rating"/>
                            </td>

                            <td>
                                <xsl:value-of select="category"/>
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