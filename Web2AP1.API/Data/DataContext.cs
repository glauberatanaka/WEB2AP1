using Microsoft.EntityFrameworkCore;
using Web2AP1.API.Models;

namespace Web2AP1.API.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base (options)
        {
        }

        public DbSet<Aluno> Alunos { get; set; }
    }
}