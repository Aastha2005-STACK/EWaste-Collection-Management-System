<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">

        <html>

            <head>

                <title>Feedback XML Database</title>

                <style>

                    body {
                        font-family: Arial;
                        margin: 30px;
                    }

                    h1 {
                        text-align: center;
                    }

                    table {
                        width: 100%;
                        border-collapse: collapse;
                    }

                    th, td {
                        border: 1px solid black;
                        padding: 10px;
                        text-align: center;
                    }

                    th {
                        background-color: lightgray;
                    }

                </style>

            </head>

            <body>

                <h1>Feedback XML Database Summary</h1>

                <table>

                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Rating</th>
                        <th>Category</th>
                        <th>Comment</th>
                    </tr>

                    <xsl:for-each select="feedbacks/feedback">

                        <tr>

                            <td>
                                <xsl:value-of select="id"/>
                            </td>

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