using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Web2AP1.API.Data;
using Web2AP1.API.Models;

namespace Web2AP1.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AlunosController : ControllerBase
    {
        private readonly DataContext _context;

        public AlunosController(DataContext context)
        {
            _context = context;
        }

        // GET api/alunos
        [HttpGet]
        public async Task<IActionResult> GetAlunos()
        {
            var alunos = await _context.Alunos.ToListAsync();
            return Ok(alunos);
        }

        // GET api/alunos/5
        [HttpGet("{id}")]
        public async Task<IActionResult> GetAluno(int id)
        {
            var aluno = await _context.Alunos.FirstOrDefaultAsync(x => x.AlunoId == id);
            return Ok(aluno);
        }

        // POST api/alunos
        [HttpPost]
        public async Task<IActionResult> Create([FromBody] Aluno aluno)
        {
            if(aluno == null)
                return BadRequest();
            
            var result = await _context.Alunos.AddAsync(aluno);
            await _context.SaveChangesAsync();
            return Ok();
        }

        // PUT api/alunos/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] Aluno Aluno)
        {
            var model = await _context.Alunos.FirstOrDefaultAsync(x => x.AlunoId == id);
            if(model == null)
                return BadRequest("Aluno não encontrado");
            model.Nome = Aluno.Nome ?? model.Nome;
            model.Curso = Aluno.Curso ?? model.Curso;
            model.Idade = Aluno.Idade != 0 ? Aluno.Idade : model.Idade;
            model.Semestre = Aluno.Semestre != 0 ? Aluno.Semestre : model.Semestre;
            await _context.SaveChangesAsync();
            return Ok();

        }

        // DELETE api/alunos/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var aluno = await _context.Alunos.FirstOrDefaultAsync(x => x.AlunoId == id);
            if(aluno == null)
                return BadRequest("Aluno não encontrado");
            _context.Alunos.Remove(aluno);
            _context.SaveChanges(); 
            return Ok();
            
        }
    }
}