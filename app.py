import logging
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin
from flask_admin.contrib.sqla import ModelView

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:changeme@localhost:5432/postgres'
app.config['SECRET_KEY'] = 'MYSECRET'
app.config['SQLALCHEMY_ENGINE_OPTIONS'] = {"pool_size": 20, "max_overflow": 30, "connect_args": {'options':'-csearch_path=tempo'}}
# app.config['SECRET_KEY'] = 'MYSECRET'
# app.config['']



db = SQLAlchemy(app)

admin = Admin(app)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    login = db.Column(db.String(30))
    password = db.Column(db.String(32))

class Clientes(db.Model):
    cli_id = db.Column(db.Integer, primary_key=True)
    cli_nome =  db.Column(db.String(30))
    cli_cpf = db.Column(db.String(30))
    cli_nascimento = db.Column(db.DateTime, nullable=False)
    cli_data_cadastro = db.Column(db.DateTime, nullable=False)

    def __repr__(self):
            return "%r" % self.cli_nome    

class Funcionarios(db.Model):
    fun_id = db.Column(db.Integer, primary_key=True)
    fun_nome =  db.Column(db.String(30))
    fun_cpf = db.Column(db.String(30))
    fun_nascimento = db.Column(db.DateTime, nullable=False)
    # fun_data_cadastro = db.Column(db.DateTime, nullable=True, )
    
    def __repr__(self):
            return "%r" % self.fun_nome

class Pedido(db.Model):
    ped_codigo = db.Column(db.Integer, primary_key=True)

    ped_cliente = db.Column(db.Integer, db.ForeignKey('clientes.cli_id'),nullable=False)
    cliente = db.relationship('Clientes', backref=db.backref('Pedido', lazy=True))

    ped_funcionario_id = db.Column(db.Integer, db.ForeignKey('funcionarios.fun_id'),nullable=False)
    funcionario = db.relationship('Funcionarios', backref=db.backref('Pedido', lazy=True))
    
    ped_data = db.Column(db.DateTime, nullable=False)

    


admin.add_view(ModelView(User,db.session))
admin.add_view(ModelView(Clientes,db.session))
admin.add_view(ModelView(Funcionarios,db.session))
admin.add_view(ModelView(Pedido,db.session))

if __name__ == '__main__':
    app.run(debug=True)
