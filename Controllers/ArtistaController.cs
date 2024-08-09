using Discografia.Context;
using Discografia.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Discografia.Controllers;
[Route("[controller]")]
[ApiController]
public class ArtistaController : ControllerBase
{
    private readonly AppDbContext _context;

    public ArtistaController(AppDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public ActionResult<IEnumerable<Artista>> Get()
    {
        var content = _context.Artistas.ToList();
        if (content is null)
        {
            return NotFound();
        }

        return Ok(content);
    }

    [HttpGet("{id:int:min(1)}", Name = "ObterArtista")]
    public async Task<ActionResult<Artista>> GetOne(int id)
    {
        var content = await _context.Artistas.FirstOrDefaultAsync(p => p.ArtistaId == id);
        if (content is null)
        {
            return NotFound("Artista não encontrado");
        }

        return Ok(content);

    }

    [HttpGet("musicas")]
    public async Task<ActionResult<IEnumerable<Artista>>> GetArtistaMusicas()
    {
        var content = await _context.Artistas.Include(p => p.musicasArtista).ToListAsync();
        if (content is null)
        {
            return BadRequest();
        }

        return Ok(content);
    }

    [HttpPost]
    public ActionResult<Artista> Post(Artista artista)
    {
        if (artista is null)
        {
            return BadRequest();
        }
        
        _context.Artistas.Add(artista);
        _context.SaveChanges();
        
        return new CreatedAtRouteResult("ObterArtista",
            new { id = artista.ArtistaId }, artista);
    }

    [HttpDelete("{id:int:min(1)}")]
    public ActionResult<Artista> Delete(int id)
    {
        var artista = _context.Artistas.FirstOrDefault(p => p.ArtistaId == id);

        if (artista is null)
        {
            return NotFound();
        }

        _context.Artistas.Remove(artista);
        _context.SaveChanges();

        return Ok(artista);
    }

    [HttpPut("{id:int:min(1)}")]
    public ActionResult<Artista> Put(int id, Artista artista)
    {
        if (id != artista.ArtistaId)
        {
            return BadRequest();
        }

        _context.Entry(artista).State = EntityState.Modified;
        _context.SaveChanges();

        return Ok(artista);
    }
}