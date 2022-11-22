<%@ Page Title="" Language="C#" MasterPageFile="~/master_page.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="_erik.caballeroh.pages.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Login
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
            height: 55vh;
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
            <form id="formulario_login" runat="server" class="form">
                    <h2 class="form__h2">Iniciar sesion</h2>
                    
                    <div class="campo">
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
                        <asp:TextBox ID="tbUsuario" CssClass="campo__input" runat="server" placeholder="Nombre de Usuario"></asp:TextBox>
                    </div>
                    
                    <div class="campo">
                        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                        <asp:TextBox ID="tbPassword" CssClass="campo__input" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox>
                    </div>
                    
                    <div class="campo">
                        <asp:Label runat="server" CssClass="error" ID="lblError"></asp:Label>
                    </div>
                    
                    <div class="campo">
                        <asp:Button ID="BtnIngresar" CssClass="btn btn-primary btn-dark" runat="server" Text="Ingresar" OnClick="BtnIngresar_Click" />
                    </div>

            </form>
    </main>

</asp:Content>
