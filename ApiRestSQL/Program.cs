using ApiMsqlData;
using ApiMsqlData.Repositories;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
//conexión a mysql
var configMySql = new MySqlConf(builder.Configuration.GetConnectionString("MysqlConnection"));
builder.Services.AddSingleton(configMySql);
//Invocaciones de repositorios

builder.Services.AddScoped<IUsuarioRepository, UsuarioRepository>();
builder.Services.AddScoped<ILigaRepository, LigaRepository>();
builder.Services.AddScoped<ITarjetaRepository, TarjetaRepository>();
builder.Services.AddScoped<ILigaUsuarioRepository, LigaUsuarioRepository>();
builder.Services.AddScoped<IPagoRepository, PagoRepository>();
builder.Services.AddScoped<IEquipoRepository, EquipoRepository>();
builder.Services.AddScoped<IEstadioRepository, EstadioRepository>();

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
