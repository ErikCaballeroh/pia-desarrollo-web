<%@ Page Title="" Language="C#" MasterPageFile="~/master_page.Master" AutoEventWireup="true" CodeBehind="crud.aspx.cs" Inherits="_erik.caballeroh.pages.crud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    CRUD
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <style>
        :root {
            --error: #ff2e2e;
            --error-ligth: #ffb3b3;
        }

        main {
            width: 100%;
            height: auto;
            display: flex;
            justify-content: center;
            align-items: flex-end;
        }

        .form {
            /* colores */
            --primario: #f6f6f6;
            --secundario: #d2d2d2;
            --input: #ffffff96;
            --boton: #000000;
            --botonsec: #181818;
            /* estilos */
            background-color: var(--primario);
            padding: 25px 20px;
            width: 65%;
            max-width: 420px;
            border-radius: 7px;
            font-family: 'Roboto Flex', sans-serif;
            font-size: 1.2em;
            font-weight: 300;
        }

        label {
            padding-bottom: 2px;
        }

        input, select {
            display: block;
            width: 100%;
            height: 35px;
            background: var(--input);
            border: 1px solid var(--secundario);
            outline: none;
            border-radius: 5px;
            padding: 0 5px;
            font-size: 1em;
        }

            input:focus, select:focus {
                outline: 1px solid var(--boton);
            }

            input[type="submit"] {
                background: var(--boton);
                color: #fff;
                transition: background .07s ease-in;
                margin:15px 0;
            }

                input[type="submit"]:hover {
                    background: #181818;
                    cursor: pointer;
                }

        label {
            display: block;
            width: 100%;
        }

        .campo {
            padding: 8px 0;
        }

        .form__h2 {
            font-weight: 500;
            font-size: 1.8em;
        }

        .error {
            text-align: center;
            font-size: 1em;
            font-weight: 500;
            color: var(--error);
            width: 10%;
            margin: 20px auto;
            border-radius: 3px;
            min-width: 250px;
            padding: 5px;
        }
    </style>

    <main>
        <form runat="server" class="form">
            <div>
                <div class="form__h2">
                    <asp:Label runat="server" CssClass="h2" ID="lbltitulo"></asp:Label>
                </div>
                <div class="campo">
                    <label class="form-label">Nombre del mod</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="tbpcnombre"></asp:TextBox>
                </div>
                <div class="campo">
                    <label class="form-label">Tematica</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="tbtematica"></asp:TextBox>
                </div>
                <div class="campo">
                    <label class="form-label">Procesador</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="tbcpu"></asp:TextBox>
                </div>
                <div class="campo">
                    <label class="form-label">Tarjeta de video</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="tbgpu"></asp:TextBox>
                </div>
                <div class="campo">
                    <label class="form-label">Fecha de creacion</label>
                    <asp:TextBox runat="server" TextMode="DateTime" CssClass="form-control" ID="tbdate"></asp:TextBox>
                    <asp:RegularExpressionValidator CssClass="error" ErrorMessage="El formato de fecha es incorrecto" 
                        ControlToValidate="tbdate" runat="server" ValidationExpression="^([0-2][0-9]|3[0-1])(\/|-)(0[1-9]|1[0-2])\2(\d{4})$"/>
                </div>
                <asp:Button runat="server" ID="BtnCreate" Text="Create" Visible="false" OnClick="BtnCreate_Click" />
                <asp:Button runat="server" ID="BtnUpdate" Text="Update" Visible="false" OnClick="BtnUpdate_Click" />
                <asp:Button runat="server" ID="BtnDelete" Text="Delete" Visible="false" OnClick="BtnDelete_Click" />
                <asp:Button runat="server" ID="BtnVolver" Text="Volver" Visible="True" OnClick="BtnVolver_Click" />
            </div>
        </form>
    </main>
</asp:Content>
