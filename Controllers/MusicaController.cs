using Discografia.Context;
using Discografia.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Discografia.Controllers;
[Route("[controller]")]
[ApiController]
public class MusicaController : ControllerBase
{
    private readonly AppDbContext _context;

    public MusicaController(AppDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public ActionResult<IEnumerable<Musica>> Get()
    {
        var content = _context.Musicas.ToList();

        if (content is null)
        {
            return NotFound();
        }

        return Ok(content);
    }

    [HttpGet("{id:int:min(1)}", Name = "ObterMusica")]
    public ActionResult<Musica> Get(int id)
    {
        var content = _context.Musicas.FirstOrDefault(p => p.MusicaId == id);

        if (content is null)
        {
            return NotFound();
        }

        return Ok(content);
    }

    [HttpPost]
    public ActionResult<Musica> Post(Musica Musica)
    {
        if (Musica is null)
        {
            return BadRequest();
        }

        try
        {
            _context.Musicas.Add(Musica);
            _context.SaveChanges();

            return new CreatedAtRouteResult("ObterMusica", new { id = Musica.MusicaId }, Musica);
        }
        catch (Exception e)
        {
            var test = e;
            throw;
        }
    }

    [HttpDelete("{id:int:min(1)}")]
    public ActionResult<Musica> Delete(int id)
    {
        var musica = _context.Musicas.FirstOrDefault(p => p.MusicaId == id);

        if (musica is null)
        {
            return NotFound();
        }

        _context.Musicas.Remove(musica);
        _context.SaveChanges();
        return Ok(musica);
    }

    [HttpPut("{id:int:min(1)}")]
    public ActionResult<Musica> Update(int id, Musica musica)
    {
        if (id != musica.MusicaId)
        {
            return BadRequest();
        }
        _context.Entry(musica).State = EntityState.Modified;
        _context.SaveChanges();
        return Ok(musica);
    }
}